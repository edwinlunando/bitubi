class RemovePurchaseTypeFromLineItems < ActiveRecord::Migration
  def change
    remove_column :line_items, :purchase_type, :string
  end
end
