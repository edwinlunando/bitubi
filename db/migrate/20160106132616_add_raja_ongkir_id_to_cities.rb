class AddRajaOngkirIdToCities < ActiveRecord::Migration
  def change
    add_column :cities, :raja_ongkir_id, :integer
  end
end
