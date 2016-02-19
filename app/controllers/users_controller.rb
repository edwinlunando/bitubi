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
    @date_from = params[:date_from].present? ? Date.parse(params[:date_from]) : nil
    @date_to = params[:date_to].present? ? Date.parse(params[:date_to]) : nil

    @orders = current_user.orders.created.includes(:line_items)

    @orders = @orders.where(id: @id) if @id.present?
    @orders = @orders.where(receipt_number: @receipt_number) if @receipt_number.present?

    if @date_from.present? && @date_to.present?
      @orders = @orders.where(payment_time: @date_from..@date_to)
    end

    @orders = @orders.page(params[:page]).per(20)
    @order = Order.new
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

  def products
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
    add_breadcrumb 'Dagangan', :dagangan_path

    @products = current_user.products
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
                   .includes(:line_items)
                   .where('products.user_id = ?', current_user.id)
                   .where(state: [:delivery, :done, :failed])
                   .order(created_at: :desc).uniq
                   .page(params[:page]).per(20)
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

  def receipt
    @order = Order.find(params[:id])
    @order.deliver unless @order.done? || @order.failed?

    if @order.update(receipt_params)
      OrderMailer.receipt(@order).deliver_now
      AdminMailer.receipt(@order).deliver_now
      redirect_to sell_view_path, notice: 'Berhasil memasukkan nomor resi'
    else
      render :sell, notice: 'Gagal memasukkan nomor resi'
    end
  end

  private

  def receipt_params
    params.require(:order).permit(:receipt_number)
  end

  def product_params
    params.require(:product).permit(:name, :slug, :stock, :description, :category_id, :unit, :weight, :price_dropship, :recommended_price,
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
