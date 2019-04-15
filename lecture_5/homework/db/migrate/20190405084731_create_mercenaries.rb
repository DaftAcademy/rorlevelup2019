class CreateMercenaries < ActiveRecord::Migration[5.2]
  def change
    create_table :mercenaries do |t|
      t.string :name
      t.integer :experience
      t.string :preferred_weapon_kind
      t.datetime :available_from
      t.integer :price
      t.belongs_to :warrior, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
