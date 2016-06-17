class AddActiveAndAmountToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :active, :boolean
    add_column :promotions, :amount, :decimal
  end
end
