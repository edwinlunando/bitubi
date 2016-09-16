class CreateAdjustments < ActiveRecord::Migration
  def change
    create_table :adjustments do |t|
      t.references :order, index: true, foreign_key: true
      t.decimal :amount
      t.references :source, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end
