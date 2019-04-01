class CreateWalls < ActiveRecord::Migration[5.2]
  def change
    create_table :walls do |t|
      t.string :name, null: false
      t.integer :thickness, default: 0
      t.timestamps
    end
  end
end
