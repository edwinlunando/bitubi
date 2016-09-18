class AddCancelTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cancel_time, :datetime
  end
end
