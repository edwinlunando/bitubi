class AddNameToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :name, :string
    add_attachment :suppliers, :image
    add_column :suppliers, :description, :text
  end
end
