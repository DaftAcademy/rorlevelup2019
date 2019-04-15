class BuildingsQuery

  def self.find_building(building_id: nil)
    if building_id
      Building.find(building_id)
    end
  end
end
