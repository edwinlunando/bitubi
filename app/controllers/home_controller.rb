class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:topup, :topup_credit]

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

  def remove_from_cart
    @order = current_user.get_last_order
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:success] = 'Barang berhasil dibuang!'
    redirect_to keranjang_path
  end

  def cart
    @order = current_user.get_last_order
  end

  def finish
    @address = Address.new(address_params)
    @order = current_user.get_last_order
    @order.address = @address
    @order.save
    current_user.credit -= @order.get_total
    current_user.save
    flash[:success] = 'Transaksi berhasil'
    redirect_to root_path
  end

  def address
    @order = current_user.get_last_order
    if current_user.credit < @order.get_total
      flash[:error] = 'Saldo kamu tidak cukup untuk menyelesaikan transaksi ini! Silahkan top up terlebih dahulu.'
      return redirect_to keranjang_path
    end
    @address = Address.new
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

  def address_params
    params.require(:address).permit(:state, :name)
  end

end
