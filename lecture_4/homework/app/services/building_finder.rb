# frozen_string_literal: true

class BuildingFinder
  def initialize(building_id)
    @building_id = building_id
  end

  def call
    find_building
  end

  private

  attr_reader :building_id

  def find_building
    Building.find_by(id: @building_id) if @building_id
  end
end
