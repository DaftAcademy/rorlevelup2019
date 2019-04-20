class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name, null: false, unique: true
      t.string :type, null: false
      t.integer :min_range, null: false
      t.integer :max_range, null: false
      t.integer :damage, null: false
      t.references :warrior, foreign_key: true, index: true, on_delete: :cascade

      t.timestamps
    end
  end
end
