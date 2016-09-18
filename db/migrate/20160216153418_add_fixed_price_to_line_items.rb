class AddFixedPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :fixed_price, :decimal
  end
end
