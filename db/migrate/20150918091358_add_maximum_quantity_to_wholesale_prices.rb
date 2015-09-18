class AddMaximumQuantityToWholesalePrices < ActiveRecord::Migration
  def change
    add_column :wholesale_prices, :maximum_quantity, :integer
  end
end
