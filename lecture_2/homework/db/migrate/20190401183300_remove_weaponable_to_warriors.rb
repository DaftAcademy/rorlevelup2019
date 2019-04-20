class RemoveWeaponableToWarriors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :warriors, :weaponable, polymorphic: true, index: true
  end
end
