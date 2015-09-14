class HomeController < ApplicationController

  def index
  end

  def product
    @categories = Category.all
    @products = Product.page(params[:page])
  end

  def detail
    @product = Product.friendly.find(params[:id])
  end

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

  def topup
    @top_up = TopUp.new
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

  def top_up_params
    params.require(:top_up).permit(:name, :amount, :bank)
  end

end
