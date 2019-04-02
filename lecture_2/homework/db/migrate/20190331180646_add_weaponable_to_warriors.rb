class AddWeaponableToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :weaponable, polymorphic: true, index: true
  end
end
