class AddCreditToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credit, :decimal, default: 0
  end
end
