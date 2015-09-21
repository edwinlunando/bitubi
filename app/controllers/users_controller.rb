# Controller to show user data things
class UsersController < ApplicationController
  before_action :authenticate_user!

  def orders
    @orders = current_user.orders
  end

  def order
    @order = current_user.orders.find(params[:id])
  end
end
