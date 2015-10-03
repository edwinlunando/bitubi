# Main controller for pretty much everything
class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:topup, :topup_credit, :cart, :remove_from_cart]

  def index
    @categories = Category.all
    @products = Product.page(params[:page])
    render controller: :products, action: :index
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
    @order = current_user.last_order
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:success] = 'Barang berhasil dibuang!'
    redirect_to keranjang_path
  end

  def cart
    @order = current_user.last_order
    if @order.cart?
      @order.checkout
      @order.save
    end
  end

  def addressing
    @address = Address.new(address_params)
    if StateShipmentPrice.where(state_id: address_params[:state_id]).where(shipment_type_id: address_params[:shipment_type]).count == 0
      flash.now[:error] = 'Harga pengiriman tidak ditemukan'
      return render action: :address
    end
    @shipment_price = StateShipmentPrice.where(state_id: address_params[:state_id]).where(shipment_type_id: address_params[:shipment_type]).first
    @order = current_user.last_order
    @order.address = @address
    @order.state_shipment_price = @shipment_price
    # todo transaction
    if @order.save
      redirect_to konfirmasi_path
    else
      render action: :address
    end
  end

  def address
    @order = current_user.last_order
    if @order.address?
      @order.addressing
      @order.save
    end

    @address = Address.new
  end

  def login
    return redirect_to root_path if user_signed_in?
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

  def confirmation
    @order = current_user.last_order
  end

  def finish
    @order = current_user.last_order
    return redirect_to(root_path, notice: 'Transaksi belum selesai!') unless @order.payment?
    @order.pay
    @order.save
    current_user.credit -= @order.total
    current_user.save
    flash[:success] = 'Transaksi berhasil'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def top_up_params
    params.require(:top_up).permit(:name, :amount, :bank)
  end

  def address_params
    params.require(:address).permit(:state_id, :name, :province, :city, :shipment_type)
  end

end
