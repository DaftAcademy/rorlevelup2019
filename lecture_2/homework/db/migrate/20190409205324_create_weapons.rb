class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :type, default: "Sword"
      t.string :kind, default: "melee"
      t.integer :damage, default: 100
      t.integer :range, default: 2

      t.timestamps
    end
  end
end
