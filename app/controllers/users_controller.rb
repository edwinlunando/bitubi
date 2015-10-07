# Controller to show user data things
class UsersController < ApplicationController

  before_action :authenticate_user!

  def orders
    @orders = current_user.orders
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

  def sell
    @line_items = LineItem.joins(:product, :order).where('products.user_id = ?', current_user.id).where('orders.state = ?', :done)
  end

end
