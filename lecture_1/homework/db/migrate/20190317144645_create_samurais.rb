class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name, null: false
      t.integer :armor_quality, default: 0
      t.integer :battle_count, default: 0
      t.date :join_date, default: Time.now
      t.integer :death_date
      t.references :clan, foreign_key: true, index: true

      t.timestamps
    end
  end
end
