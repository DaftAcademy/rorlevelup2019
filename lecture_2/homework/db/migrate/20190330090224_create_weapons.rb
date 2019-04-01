class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.integer :range, default: 0
      t.integer :damage, default: 0
      t.references :warrior, foreign_key: true, index: true
      t.timestamps
    end
  end
end
