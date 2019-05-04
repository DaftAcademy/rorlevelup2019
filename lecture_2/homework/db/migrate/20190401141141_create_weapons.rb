class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.integer :damage, default: 1
      t.integer :range, default: 2
      t.string :type, default: 'MagicalWeapon'
      t.timestamps
    end
  end
end
