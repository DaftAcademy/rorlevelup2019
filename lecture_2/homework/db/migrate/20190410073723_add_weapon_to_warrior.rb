class AddWeaponToWarrior < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :equipment, :string, null: true
  end
end
