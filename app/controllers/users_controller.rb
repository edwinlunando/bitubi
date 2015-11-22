# Controller to show user data things
class UsersController < ApplicationController

  before_action :authenticate_user!

  def topup_credit
    @top_up = TopUp.new(top_up_params)
    @top_up.user = current_user
    if @top_up.save
      flash[:success] = 'Berhasil isi saldo! Saldo Anda akan bertambah setelah kami verifikasi.'
      redirect_to saldo_path
    else
      render action: :topup
    end
  end

  def account_edit
    return redirect_to account_path, notice: 'Akun berhasil di-update' if current_user.update(user_params)
    render :account
  end

  def account
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
  end

  def topup
    @top_up = TopUp.new
    @top_up.set_up_first unless current_user.verified
  end

  def orders
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
    add_breadcrumb 'Pesanan', :pesanan_path

    @orders = current_user.orders.includes(:line_items, :state_shipment_price)
  end

  def order
    @order = current_user.orders.find(params[:id])

    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Pesanan', :pesanan_path
    add_breadcrumb 'Detil', "/pesanan/#{@order.id}"
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

  def create_product
    @product = Product.new(product_params)
    @product.user = current_user

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

    @orders = Order.joins(line_items: [:product])
                   .includes(:line_items)
                   .where('products.user_id = ?', current_user.id)
                   .order(created_at: :desc)
  end

  def sell_view
    @order = Order.find(params[:id])

    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
    add_breadcrumb 'Penjualan', :sell_path
    add_breadcrumb 'Detil', "/penjualan/#{@order.id}"
  end

  def receipt
    @order = Order.find(params[:id])
    @order.deliver
    if @order.update(receipt_params)
      OrderMailer.receipt(@order).deliver_now
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
    params.require(:product).permit(:name, :slug, :stock, :description, :category_id, :unit, :weight, :price_dropship,
                                    wholesale_prices_attributes: [:id, :price, :minimum_quantity, :maximum_quantity, :_destroy],
                                    product_images_attributes: [:id, :data, :_destroy])
  end

  def top_up_params
    params.require(:top_up).permit(:name, :amount, :bank, :uid)
  end

  def user_params
    params.require(:user).permit(:email, :phone_number, :first_name, :last_name,
                                 supplier_attributes: [:name, :image, :bank_account_number, :description, :address])
  end

end
