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
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Akun', :account_path
    add_breadcrumb 'Keranjang', :keranjang_path

    if @order.cart?
      @order.checkout
      @order.save
    end
  end

  def shipment_cost
    state = State.find params[:id]
    courier = params[:courier]
    parameter = {
      key: ENV['RAJA_ONGKIR_KEY'],
      originType: 'city',
      origin: @order.suppliers.first.supplier.city.raja_ongkir_id,
      destinationType: 'subdistrict',
      destination: state.raja_ongkir_id,
      weight: @order.total_weight_gram,
      courier: courier
    }
    response = RestClient.post 'http://pro.rajaongkir.com/api/cost', parameter
    json = JSON.parse(response)
    @results = json['rajaongkir']['results'].first['costs']
    response.headers['Cache-Control'] = 'no-transform'
    render layout: false
  end

  def addressing
    @address = Address.new(address_params)
    courier = address_params[:courier]
    parameter = {
      key: ENV['RAJA_ONGKIR_KEY'],
      originType: 'city',
      origin: @order.suppliers.first.supplier.city.raja_ongkir_id,
      destinationType: 'subdistrict',
      destination: @address.state.raja_ongkir_id,
      weight: @order.total_weight_gram,
      courier: courier
    }
    shipment_type = @address.shipment_type
    response = RestClient.post 'http://pro.rajaongkir.com/api/cost', parameter
    json = JSON.parse(response)
    @results = json['rajaongkir']['results'].first['costs']
    shipment = @results.detect { |result| result['service'] == shipment_type }
    @order.shipment_price_value = shipment['cost'].first['value']
    @order.shipment_price_code = shipment['service']
    @order.shipment_price_courier = courier
    @order.shipment_price_name = shipment['description']
    @order.shipment_price_etd = shipment['cost'].first['etd']
    # if StateShipmentPrice.where(state_id: address_params[:state_id]).where(shipment_type_id: address_params[:shipment_type]).count == 0
    #   flash.now[:error] = 'Harga pengiriman tidak ditemukan'
    #   return render action: :address
    # end
    # @shipment_price = StateShipmentPrice.where(state_id: address_params[:state_id]).where(shipment_type_id: address_params[:shipment_type]).first
    @order.state = 'payment'
    @order.address = @address
    # @order.state_shipment_price = @shipment_price

    if @order.total > current_user.credit
      flash.now[:error] = 'Saldo tidak mencukupi. Silahkan top up saldo terlebih dahulu.'
      return render action: :address
    end

    if @order.save
      if address_params[:code].present?
        promotions = Promotion.code.active.where(code: address_params[:code])
        if promotions.exists?
          promotion = promotions.first
          if promotion.eligible?(current_user)
            @order.adjustments.where(source: promotion).destroy_all
            if promotion.free_delivery?
              discount_value = -@order.shipment_price_value
              discount_value = -promotion.amount if discount_value < -promotion.amount
            else
              discount_value = 0
            end
            Adjustment.create(order: @order, source: promotion, amount: discount_value)
            promotion.usage = promotion.usage + 1
            promotion.save
          else
            flash.now[:notice] = 'Promosi ini sudah tidak berlaku atau sudah mencapai limitnya!'
            return render action: :address
          end
        else
          flash.now[:notice] = 'Kode promosi tidak ditemukan!'
          return render action: :address
        end
      end
      redirect_to konfirmasi_path
    else
      render action: :address
    end
  end

  def address
    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Keranjang', :keranjang_path
    add_breadcrumb 'Alamat Kirim', :alamat_path

    return redirect_to saldo_path, notice: 'Anda harus membayar biaya pendaftaran!' unless current_user.verified
    return redirect_to saldo_path, notice: 'Saldo Anda kurang!' if @order.valid_with_credit

    @address = Address.new
  end

  def confirmation
    return redirect_to addressing_path, notice: 'Belum ada alamat' if @order.address.blank?

    add_breadcrumb 'Home', :root_path
    add_breadcrumb 'Keranjang', :keranjang_path
    add_breadcrumb 'Alamat Kirim', :alamat_path
    add_breadcrumb 'Pembayaran', :konfirmasi_path
  end

  def finish
    return redirect_to(root_path, notice: 'Transaksi sudah selesai!') if @order.done? || @order.delivery?
    return redirect_to(root_path, notice: 'Transaksi belum selesai!') unless @order.payment?
    ActiveRecord::Base.transaction do
      @order.pay
      @order.payment_time = Time.zone.now
      @order.save
      current_user.credit -= @order.total_with_adjustments
      @order.adjustments.each do |adjustment|
        if adjustment.source.cashback?
          current_user.credit += adjustment.source.amount
          current_user.cashback_promotion_limit = true
        end
      end
      current_user.save
    end
    UserMailer.order_confirmation(@order).deliver_now
    OrderMailer.confirmation(@order, @order.suppliers.first).deliver_now
    flash[:success] = 'Transaksi berhasil'
    redirect_to root_path
  end

  def ship
    order = Order.find(params[:id])

    order.deliver

    if order.update(ship_params)
      flash[:success] = 'Order berhasil dikirim'
    else
      flash[:error] = 'Order gagal dikirim'
    end

    redirect_to sell_path
  end

  def cancel
  end

  private

  def address_params
    params.require(:address).permit(:state_id, :name, :province, :city, :courier, :shipment_type, :receiver_name, :code,
                                    :receiver_phone, :sender_name, :sender_phone, :zipcode, :special_instructions)
  end

  def ship_params
    params.require(:order).permit(:receipt_number)
  end

  def set_last_order
    @order = current_user.last_order
  end

end
