class AddWeaponTypeToWarrior < ActiveRecord::Migration[5.2]
  def change
    add_column :warriors, :weapon_type, :string
  end
end
