class AddTypeToWeapon < ActiveRecord::Migration[5.2]
  def change
    add_column :weapons, :type, :string, default: 'Melee'
  end
end
