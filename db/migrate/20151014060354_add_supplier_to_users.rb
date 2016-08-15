class AddSupplierToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :supplier, index: true, foreign_key: true
  end
end
