class AddDefaultRiceNeed < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :default_rice_need, :integer, default: 0
    
    Building.find_each { |building| Reports::SiegeReport.check_siege_ability(building: building) }
  end
end
