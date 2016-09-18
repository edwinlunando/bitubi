class AddBankTransferToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :bank_transfer, :string
    add_column :orders, :bank_amount, :decimal
  end
end
