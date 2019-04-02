class CreateStrongholdAndBarricadeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :stronghold do |t|
      t.string :name, null: false, limit: 256
      t.integer :defense, null: false
    end

    create_table :barricade do |t|
      t.string :name, null: false, limit: 256
      t.integer :defense, null: false
    end
  end
end
