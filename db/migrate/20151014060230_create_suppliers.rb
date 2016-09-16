class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :address
      t.string :bank_account_number

      t.timestamps null: false
    end
  end
end
