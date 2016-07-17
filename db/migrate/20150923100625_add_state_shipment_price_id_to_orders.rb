class AddStateShipmentPriceIdToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :state_shipment_price, index: true, foreign_key: true
  end
end
