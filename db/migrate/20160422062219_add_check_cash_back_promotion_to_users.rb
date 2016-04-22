class AddCheckCashBackPromotionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cashback_promotion_limit, :boolean
  end
end
