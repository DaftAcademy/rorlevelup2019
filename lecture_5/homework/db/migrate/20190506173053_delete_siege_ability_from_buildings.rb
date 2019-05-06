class DeleteSiegeAbilityFromBuildings < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :siege_ability
  end
end
