class CreateWithdrawals < ActiveRecord::Migration
  def change
    create_table :withdrawals do |t|
      t.decimal :amount
      t.references :user
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
