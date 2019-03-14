class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name
      t.integer :armor, default: 0
      t.integer :battle_count, default: 0
      t.datetime :join_at
      t.datetime :death_at
      t.references :clan, foreign_key: true

      t.timestamps
    end
  end
end
