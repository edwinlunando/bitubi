# Controller to show user data things
class UsersController < ApplicationController

  before_action :authenticate_user!

  def topup_credit
    @top_up = TopUp.new(top_up_params)
    @top_up.user = current_user
    if @top_up.save
      AdminMailer.top_up(@top_up).deliver_now
      UserMailer.top_up_confirmation(@top_up).deliver_now
      flash[:success] = 'Setelah transfer, jangan lupa untuk mengkonfirmasi transfer Anda.'
      redirect_to saldo_path
    else
      render action: :topup
    end
  end

  def change_password
    if current_user.update_with_password(change_password_params)
      sign_in(current_user, bypass: true)
      return redirect_to account_profile_path, notice: 'Password berhasil diganti'
    end
    render :account
  end

  def account_edit
    return redirect_to account_profile_path, notice: 'Akun berhasil di-update' if current_user.update(user_params)
    render :account_edit
  end

  def account
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_profile_path
    add_breadcrumb 'Ubah Password', :account_profile_path
  end

  def account_profile
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
    add_breadcrumb 'Edit Profil', :account_profile_path
  end

  def account_vendor
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_profile_path
    add_breadcrumb 'Edit Vendor', :account_vendor_path
  end

  def user_vendor
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
  end

  def topup
    @top_up = TopUp.new
    if current_user.verified
      @top_up.generate
    else
      @top_up.set_up_first
    end
  end

  def topup_transfer
    top_up = current_user.top_ups.find params[:id]
    top_up.transfer = true
    top_up.save
    redirect_to top_up_confirm_path, notice: 'Berhasil konfirmasi transfer!'
  end

  def topup_confirm
    @top_ups = current_user.top_ups.order(created_at: :desc)
  end

  def withdrawal
    @withdrawal = Withdrawal.new
  end

  def withdrawal_new
    @withdrawal = Withdrawal.new(withdrawal_params)
    @withdrawal.user_id = current_user.id
    if @withdrawal.amount > current_user.credit
      return redirect_to withdrawal_path, notice: 'Saldo yang ditarik tidak boleh melebihi jumlah saldo sekarang'
    end

    if @withdrawal.save
      AdminMailer.withdrawal(@withdrawal).deliver_now
      return redirect_to withdrawal_path, notice: 'Berhasil menarik saldo'
    end
    render :withdrawal
  end

  def orders
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
    add_breadcrumb 'Pesanan', :pesanan_path

    @id = params[:id]
    @receipt_number = params[:receipt_number]
    @state = params[:state]
    @name = params[:name]
    @users = User.where('first_name LIKE ? or last_name LIKE ?', "%#{@name}%", "%#{@name}%").pluck(:id) if @name.present?

    @date_from = params[:date_from].present? ? Date.parse(params[:date_from]) : nil
    @date_to = params[:date_to].present? ? Date.parse(params[:date_to]) : nil

    @orders = current_user.orders.created.includes(:adjustments, :state_shipment_price, line_items: [:product])

    @orders = @orders.where(id: @id) if @id.present?
    @orders = @orders.where(receipt_number: @receipt_number) if @receipt_number.present?
    @orders = @orders.where(state: @state) if @state.present?
    @orders = @orders.where(user_id: @users) if @users.present?

    if @date_from.present? && @date_to.present?
      @orders = @orders.where(payment_time: @date_from..@date_to)
    end

    @orders = @orders.page(params[:page]).per(20)
    @order = Order.new
  end

  def order_manual
    @order = Order.new(manual_order_params)
    @order.user = current_user

    if @order.parse
      AdminMailer.new_order(@order).deliver_now
      redirect_to pesanan_path, notice: 'Berhasil bikin order manual'
    else
      @orders = current_user.orders.created.includes(:line_items)
      @orders = @orders.page(params[:page]).per(20)
      render :orders
    end
  end

  def order
    @order = current_user.orders.find(params[:id])

    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Pesanan', :pesanan_path
    add_breadcrumb 'Detil', "/pesanan/#{@order.id}"
  end

  def order_filter
  end

  def order_transfer
    @order = current_user.orders.find(params[:id])
    @order.transfer
    redirect_to order_detail_path(@order), notice: 'Pesanan telah diterima!'
  end

  def order_print
    require 'barby'
    require 'barby/barcode'
    require 'barby/barcode/code_128'
    require 'barby/outputter/html_outputter'

    parameters = params[:id]
    @orders = Order.find params[:id].split('&')
    @orders.each do |order|
      if order.user_id != current_user.id
        order.printed_at = Time.now
        order.save
      end
      barcode = Barby::Code128B.new(order.id)
      order.outputter = Barby::HtmlOutputter.new(barcode)
    end

    render layout: false
  end

  def products
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
    add_breadcrumb 'Dagangan', :dagangan_path

    @products = current_user.products

    @name = params[:name]
    @published = params[:published].present? ? params[:published].to_i : nil

    @products = @products.where('name LIKE ?', "%#{@name}%") if @name.present?
    @products = @products.where(published: @published) if @published.present?
  end

  def new_product
    @product = Product.new
  end

  def delete_product
    product = Product.friendly.find(params[:id])
    product.published = false
    product.save
    redirect_to dagangan_path, notice: 'Produk berhasil dihapus'
  end

  def create_product
    @product = Product.new(product_params)
    @product.user = current_user
    @product.published = true

    return redirect_to dagangan_path if @product.save
    render :new_product
  end

  def update_product
    @product = Product.find(params[:id])
    @product.update(product_params)
    @product.update(published: true) if @product.stock > 0
    @product.update(published: false) if @product.stock <= 0
    flash.now[:notice] = 'Produk berhasil diperbarui'
    render :edit_product
  end

  def edit_product
    @product = Product.find(params[:id])
  end

  def sell
      add_breadcrumb 'Home', :root_path
      add_breadcrumb 'Akun', :account_path
      add_breadcrumb 'Penjualan', :sell_path
    
      @orders = Order.vendor.joins(line_items: [:product])
                     .includes(:line_items, :user, :state_shipment_price)
                     .where('products.user_id = ?', current_user.id)
                     .where(state: [:delivery, :done, :failed])

      if (params[:filter] == 'tertunda')
        @orders = @orders.where(printed_at: nil)
      elsif (params[:filter] == 'tercetak')
        @orders = @orders.where.not(printed_at: nil)
      end

      @id = params[:id]
      @orders = @orders.where(id: @id) if @id.present?
      
      @receipt_number = params[:receipt_number]
      @orders = @orders.where("orders.receipt_number LIKE ?", "%{@receipt_number}%") if @receipt_number.present?

      @email = params[:email]
      if @email.present?
        @orders.joins(:users).where("users.email like ?", "%{@email}%")
      end

      @date_from = params[:date_from].present? ? Date.parse(params[:date_from]) : nil
      @date_to = params[:date_to].present? ? Date.parse(params[:date_to]) : nil
      if @date_from.present? && @date_to.present?
        @orders = @orders.where(payment_time: @date_from..@date_to)
      end

      @orderby = params[:orderby]
      if @orderby.present?
        @ordering = params[:ordering] ? params[:ordering] : 'desc'
        @filter = [@orderby => @ordering]
        @orders = @orders.order(@filter)
      end

      @orders = @orders.order(created_at: :desc).uniq.page(params[:page]).per(10)
  end

  def sell_view
    @order = Order.find(params[:id])

    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
    add_breadcrumb 'Penjualan', :sell_path
    add_breadcrumb 'Detil', "/penjualan/#{@order.id}"
  end

  def sell_cancel
    @order = Order.find(params[:id])
    if @order.cancel_order
      flash[:notice] = 'Pesanan berhasil dibatalkan'
    else
      flash[:notice] = 'Pesanan gagal dibatalkan'
    end
    redirect_to sell_view_path(@order)
  end

  def sell_xls
    @orders = Order.vendor.joins(line_items: [:product])
                   .includes(:line_items, :user, :state_shipment_price)
                   .where('products.user_id = ?', current_user.id)
                   .where(state: [:delivery, :done, :failed])
    @orders = @orders.order(created_at: :desc).uniq.page(params[:page]).per(20)
    respond_to do |format|
      format.xlsx
    end
  end

  def receipt
    @order = Order.find(params[:id])
    @order.deliver unless @order.done? || @order.failed?

    unless receipt_params[:receipt_number].present?
      return redirect_to sell_view_path(@order), notice: 'Nomor resi tidak boleh kosong'
    end

    if @order.update(receipt_params)
      OrderMailer.receipt(@order).deliver_now
      AdminMailer.receipt(@order).deliver_now
      @client = Twilio::REST::Client.new
      address = @order.address
      receiver_phone = PhonyRails.normalize_number(address.receiver_phone, country_code: 'ID')
      receiver_name = address.receiver_name
      @client.messages.create(
          from: '+12053796624 ',
          to: receiver_phone,
          body: "#{receiver_name}, pesanan kamu telah terkirim dengan nomor resi ##{@order.receipt_number}"
      )
      redirect_to sell_view_path, notice: 'Berhasil memasukkan nomor resi'
    else
      render :sell, notice: 'Gagal memasukkan nomor resi'
    end
  end

  private

  def manual_order_params
    params.require(:order).permit(:manual_text)
  end

  def receipt_params
    params.require(:order).permit(:receipt_number)
  end

  def product_params
    params.require(:product).permit(:name, :slug, :stock, :description, :category_id, :unit, :weight, :price_dropship, :recommended_price, :published, :sms, :bbm,
                                    wholesale_prices_attributes: [:id, :price, :minimum_quantity, :maximum_quantity, :_destroy],
                                    product_images_attributes: [:id, :data, :_destroy])
  end

  def top_up_params
    params.require(:top_up).permit(:name, :amount, :bank, :uid)
  end

  def user_params
    params.require(:user).permit(:email, :phone_number, :first_name, :last_name, :address,
                                 supplier_attributes: [:id, :name, :image, :banner_image, :bank_account_name, :bank_name,
                                                       :bank_account_number, :description, :address, :city_id])
  end

  def withdrawal_params
    params.require(:withdrawal).permit(:amount)
  end

  def change_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

end
