class AddSiegeAbilityToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :siege_ability, :integer
  end
end
