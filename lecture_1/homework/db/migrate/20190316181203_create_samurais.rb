class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name, null: false
      t.integer :armor_class, null: false, default: 0
      t.integer :battle_no, null: false, default: 0
      t.datetime :join_date, null: false
      t.datetime :death_date
      t.references :clan, foreign_key: true
      t.timestamps
    end
  end
end
