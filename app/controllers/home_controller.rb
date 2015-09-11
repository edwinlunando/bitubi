class HomeController < ApplicationController

  def index
  end

  def product
    @products = Product.page(params[:page])
  end

  def detail
  end

  def topup
  end

  def cart
  end

  def address
  end

  def orders
  end

  def order
  end

  def login
    if user_signed_in?
      redirect_to root_path and return
    end
    render('devise/sessions/new')
  end

  def register
    render('devise/registrations/new')
  end

  def create_user
    @user = User.new(user_params)
    @user.role = 'user'
    if @user.save
      flash[:success] = 'User baru dibuat!'
      redirect_to root_path
    else
      render action: :auth
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
