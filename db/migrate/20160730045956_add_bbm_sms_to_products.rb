class AddBbmSmsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :bbm, :string
    add_column :products, :sms, :string
  end
end
