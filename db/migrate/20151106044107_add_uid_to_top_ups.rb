class AddUidToTopUps < ActiveRecord::Migration
  def change
    add_column :top_ups, :uid, :decimal
  end
end
