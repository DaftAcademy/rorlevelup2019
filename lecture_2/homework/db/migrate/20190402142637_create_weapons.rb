class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.string :type, default: 'Melee'
      t.integer :damage, default: 1
      t.integer :range, default: 1
      t.references :warrior, foreign_key: true, index: true

      t.timestamps
    end
  end
end
