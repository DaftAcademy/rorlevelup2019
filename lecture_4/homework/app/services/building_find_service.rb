# frozen_string_literal: true

class BuildingFindService
  attr_reader :building_id

  def initialize(building_id)
    @building_id = building_id
  end

  def call
    Building.find(@building_id) if building_id
  end
end
