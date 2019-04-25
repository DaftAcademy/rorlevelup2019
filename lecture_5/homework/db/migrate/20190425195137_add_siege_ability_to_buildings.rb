class AddSiegeAbilityToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :siege_ability, :float, default: 0.0, null: false
  end
end
