class AddRaWpnableToRangedWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :ranged_weapons, :ra_wpnable, polymorphic: true, index: true
  end
end
