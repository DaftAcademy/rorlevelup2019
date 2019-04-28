class ComputeSiegeAbilitiesOfBuildings < ActiveRecord::Migration[5.2]
  def change
    Building.find_each do |building|
      Reports::SiegeReport.new(building: building).call
    end
  end
end
