class CreateClanAndSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :clans do |t|
      t.string :name, null: false, limit: 256

      t.timestamps
    end

    create_table :samurais do |t|
      t.string    :name, null: false, limit: 256, unique: true
      t.integer   :combats, null: false, default: 0
      t.integer   :armor, null:false
      t.date  :joined, null: false
      t.date  :died, null: true

      t.references :clan, foreign_key: true, index: true

      t.timestamps
    end
  end
end
