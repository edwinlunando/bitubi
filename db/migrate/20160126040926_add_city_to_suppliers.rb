class AddCityToSuppliers < ActiveRecord::Migration
  def change
    add_reference :suppliers, :city, index: true, foreign_key: true
  end
end
