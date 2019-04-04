class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name, null: false
      t.string :type, null: false, default: 'Fortress'
      t.integer :defense, default: 0
      t.timestamps
    end
  end
end
