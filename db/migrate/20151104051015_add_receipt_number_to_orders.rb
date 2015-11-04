class AddReceiptNumberToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :receipt_number, :string
  end
end
