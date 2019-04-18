class CreateWalls < ActiveRecord::Migration[5.2]
  def change
    create_table :walls do |t|
      t.string :name, null: false
      t.timestamps
    end
    create_table :towers do |t|
      t.string :name, null: false
      t.timestamps
    end 
    create_table :castles do |t|
      t.string :name, null: false
      t.timestamps
    end
    
  end
end
