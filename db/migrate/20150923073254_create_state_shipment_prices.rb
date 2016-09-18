class CreateStateShipmentPrices < ActiveRecord::Migration
  def change
    create_table :state_shipment_prices do |t|
      t.belongs_to :state, index: true, foreign_key: true
      t.belongs_to :shipment_type, index: true, foreign_key: true
      t.decimal :price

      t.timestamps null: false
    end
  end
end
