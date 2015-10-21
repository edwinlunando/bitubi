class AddReceiptNumberToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :receipt_number, :string
  end
end
