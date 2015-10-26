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

  def account
    @user = current_user
  end

  def topup
    @top_up = TopUp.new
  end

  def orders
    @orders = current_user.orders.includes(:line_items, :state_shipment_price)
  end

  def order
    @order = current_user.orders.find(params[:id])
  end

  def products
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

  def edit_product
    @product = Product.find(params[:id])
  end

  def sell
    @line_items = LineItem.includes({ order: [{ address: [{ state: [{ city: :province }] }] }, :state_shipment_price, :user] }, :product)
                  .joins(:product, :order)
                  .where('products.user_id = ?', current_user.id)
                  .where('orders.state = ?', :done)
  end

  private

  def product_params
    params.require(:product).permit(:name, :slug, :stock, :description, :category_id, :unit, :weight, :price_dropship,
                                    wholesale_prices_attributes: [:id, :price, :minimum_quantity, :maximum_quantity, :_destroy],
                                    product_images_attributes: [:id, :data, :_destroy])
  end

  def top_up_params
    params.require(:top_up).permit(:name, :amount, :bank)
  end

end
