class CreateGates < ActiveRecord::Migration[5.2]
  def change
    create_table :gates do |t|

      t.string :name, null: false
      t.string :material, default: "wood"
      t.integer :thickness, default: 1
      t.integer :strength, default: 100
      t.timestamps
    end
  end
end
