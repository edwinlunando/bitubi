class AddAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :address_id, :integer, index: true, foreign_key: true
  end
end
