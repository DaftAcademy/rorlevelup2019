class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name
      t.integer :armour_quality
      t.integer :number_of_battles
      t.datetime :join_date, default: :created_at
      t.datetime :date_of_death, null: true

      t.timestamps
      t.references :clan, foreign_key: true, index: true
    end
  end
end
