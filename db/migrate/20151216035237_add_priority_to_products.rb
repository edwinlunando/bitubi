class AddPriorityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :priority, :integer
  end
end
