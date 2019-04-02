class CreateMagicals < ActiveRecord::Migration[5.2]
  def change
    create_table :magicals do |t|
      t.string :name, null: false
      t.integer :range, null: false, default: 0
      t.integer :damage, null: false, default: 0
      t.timestamps
    end
  end
end
