class AddStateToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :state, :string
  end
end
