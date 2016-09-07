class AddInvoicePrintStatusToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :printed_at, :datetime, null: true, default: nil
  end
end
