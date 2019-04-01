class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name
      t.decimal :range, default: 0
      t.integer :damage, default: 0

      t.timestamps
    end
  end
end
