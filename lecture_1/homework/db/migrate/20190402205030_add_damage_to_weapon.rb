class AddDamageToWeapon < ActiveRecord::Migration[5.2]
  def change
    add_column :weapons, :damage, :integer, null: false, default: 0
  end
end
