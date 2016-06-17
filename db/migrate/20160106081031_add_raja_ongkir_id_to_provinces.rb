class AddRajaOngkirIdToProvinces < ActiveRecord::Migration
  def change
    add_column :provinces, :raja_ongkir_id, :integer
  end
end
