class ReferenceWeaponFromWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :weapon
  end
end
