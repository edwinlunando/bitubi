class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :action_type
      t.integer :promotion_type
      t.string :code
      t.integer :global_usage_limit
      t.integer :user_usage_imit
      t.integer :usage

      t.timestamps null: false
    end
  end
end
