class AddReceiverDataToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :receiver_name, :string
    add_column :addresses, :receiver_phone, :string
    add_column :addresses, :sender_name, :string
    add_column :addresses, :sender_phone, :string
  end
end
