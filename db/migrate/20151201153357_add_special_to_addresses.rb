class AddSpecialToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :special_instructions, :text
  end
end
