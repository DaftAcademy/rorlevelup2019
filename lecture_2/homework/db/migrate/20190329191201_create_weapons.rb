class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.float :damage, default: 0.0
      t.float :range, default: 0.0
      t.references :warrior, foreign_key: true, index: true

      t.timestamps
    end
  end
end
