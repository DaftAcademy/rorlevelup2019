class CreateWalls < ActiveRecord::Migration[5.2]
  def change
    create_table :walls do |t|
      
      t.string :name, null: false
      t.integer :height, default: 10
      t.integer :thickness, default: 5
      t.integer :strength, default: 100
      t.timestamps
    end
  end
end
