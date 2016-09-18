class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.belongs_to :city

      t.timestamps
    end
  end
end
