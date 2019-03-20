class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|

      t.string :name, null: false
      t.integer :armour, null: false, default: 0
      t.integer :battle_counter, null: false, default: 0
      t.date :joined, default: Time.now
      t.date :died, null: true
      t.references :clan, foreign_key: true, index: true
      t.timestamps
    end
  end
end
