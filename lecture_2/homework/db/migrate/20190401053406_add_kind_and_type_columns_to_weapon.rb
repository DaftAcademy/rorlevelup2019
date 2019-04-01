class AddKindAndTypeColumnsToWeapon < ActiveRecord::Migration[5.2]
  def change
    add_column :weapons, :kind, :string, default: 'melee'
    add_column :weapons, :type, :string, default: 'Sword'
    remove_column :weapons, :name, :string
  end
end
