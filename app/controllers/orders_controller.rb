# controller to address order related page
class OrderController < ApplicationController

  before_action :authenticate_user!, only: [:topup, :topup_credit, :cart, :remove_from_cart]

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

  def confirmation
    @order = current_user.last_order
  end

  def finish
    @order = current_user.last_order
    return redirect_to(root_path, notice: 'Transaksi sudah selesai!') unless @order.done?
    return redirect_to(root_path, notice: 'Transaksi belum selesai!') unless @order.payment?
    @order.finish
    @order.save
    current_user.credit -= @order.total
    current_user.save
    UserMailer.order_confirmation(@order)
    @order.suppliers.each do |supplier|
      OrderMailer.confirmation(@order, supplier)
    end
    flash[:success] = 'Transaksi berhasil'
    redirect_to root_path
  end

  private

  def address_params
    params.require(:address).permit(:state_id, :name, :province, :city, :shipment_type)
  end

end
