class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.integer :damage, null: false, default: 1
      t.integer :range, null: false
      t.timestamps
    end
  end
end
