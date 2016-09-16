class AddTransferTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :transfer_time, :datetime
    add_column :orders, :transferred, :boolean
  end
end
