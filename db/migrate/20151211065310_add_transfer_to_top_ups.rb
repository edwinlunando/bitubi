class AddTransferToTopUps < ActiveRecord::Migration
  def change
    add_column :top_ups, :transfer, :boolean
  end
end
