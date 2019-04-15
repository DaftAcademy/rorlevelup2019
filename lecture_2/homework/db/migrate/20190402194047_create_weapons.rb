class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.integer :range, default: 0
      t.integer :damage, default: 0
      t.string :name
      t.string :type, default: "Ranged"
      t.references :warrior, foreign_key: true, index: true
      t.timestamps
    end
  end
end
