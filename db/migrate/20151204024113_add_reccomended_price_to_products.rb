class AddReccomendedPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :recommended_price, :decimal
  end
end
