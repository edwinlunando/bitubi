class AddPaymentTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_time, :datetime
  end
end
