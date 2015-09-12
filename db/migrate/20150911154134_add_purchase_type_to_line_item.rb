class AddPurchaseTypeToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :purchase_type, :integer
  end
end
