class AddSiegeAbilityOnBuilding < ActiveRecord::Migration[5.2]
  def change
  	add_column :buildings, :siege_ability, :integer, default: 0, null: false

  	Building.find_each { |building| Reports::SiegeReport.new(building: building).call }
  end
end
