class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name, null: false
      t.integer :armor
      t.integer :num_battles, default: 0
      t.datetime :date_join
      t.datetime :date_death
      t.references :clan, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
