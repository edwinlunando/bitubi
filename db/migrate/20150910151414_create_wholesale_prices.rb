class CreateWholesalePrices < ActiveRecord::Migration
  def change
    create_table :wholesale_prices do |t|
      t.decimal :price
      t.integer :minimum_quantity
      t.boolean :active
      t.belongs_to :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
