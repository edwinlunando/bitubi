# controller to address order related page
class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_last_order

  def remove_from_cart
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:success] = 'Barang berhasil dibuang!'
    redirect_to keranjang_path
  end

  def cart
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
    @order.addressing
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
    return redirect_to saldo_path, notice: 'Saldo Anda kurang!' if @order.valid_with_credit

    @address = Address.new
  end

  def confirmation
  end

  def finish
    return redirect_to(root_path, notice: 'Transaksi sudah selesai!') if @order.done?
    return redirect_to(root_path, notice: 'Transaksi belum selesai!') unless @order.payment?
    ActiveRecord::Base.transaction do
      @order.finish
      @order.payment_time = Time.zone.now
      @order.save
      current_user.credit -= @order.total
      current_user.save
    end
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

  def set_last_order
    @order = current_user.last_order
  end

end
