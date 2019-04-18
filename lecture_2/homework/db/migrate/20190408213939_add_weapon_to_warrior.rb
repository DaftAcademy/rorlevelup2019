class AddWeaponToWarrior < ActiveRecord::Migration[5.2]
  def change

    create_table :weapons do |t|
      t.integer :damage, null: false
      t.integer :range, null: false
      t.timestamps
      t.string :type, null: false
    end

    add_reference :weapons, :warrior

  end
end
