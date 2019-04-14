class AddMaWpnableToMagicalWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :magical_weapons, :ma_wpnable, polymorphic: true, index: true
  end
end
