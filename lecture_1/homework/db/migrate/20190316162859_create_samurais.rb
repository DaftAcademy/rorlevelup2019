class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name, null: false, limit: 66
      t.integer :armor_quality, null: false
      t.date :joined, null: false
      t.date :died, null: true  
      t.references :clan, foreign_key: true, index: true
    end
  end
end
