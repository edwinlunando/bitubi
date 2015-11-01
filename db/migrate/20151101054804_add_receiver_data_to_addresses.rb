class AddReceiverDataToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :receiver_name, :string
    add_column :addresses, :receiver_phone, :string
    add_column :addresses, :string, :string
    add_column :addresses, :sender_name, :string
  end
end
