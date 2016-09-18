class AddRajaOngkirIdToStates < ActiveRecord::Migration
  def change
    add_column :states, :raja_ongkir_id, :integer
  end
end
