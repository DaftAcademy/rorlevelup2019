class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :type
      t.string :name
      t.integer :damage
      t.integer :range
      t.references :warrior, foreign_key: true

      t.timestamps
    end
  end
end
