class CreateTopUps < ActiveRecord::Migration
  def change
    create_table :top_ups do |t|
      t.decimal :amount
      t.string :name
      t.string :bank
      t.boolean :approved
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
