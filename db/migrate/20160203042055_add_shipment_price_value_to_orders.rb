class AddShipmentPriceValueToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipment_price_value, :decimal
    add_column :orders, :shipment_price_code, :string
    add_column :orders, :shipment_price_courier, :string
    add_column :orders, :shipment_price_name, :string
    add_column :orders, :shipment_price_etd, :string
  end
end
