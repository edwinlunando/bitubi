class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.decimal :price_dropship
      t.decimal :price_wholesale
      t.integer :stock
      t.string :unit
      t.decimal :weight
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
