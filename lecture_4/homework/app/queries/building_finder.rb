# frozen_string_literal: true

class BuildingFinder
  attr_reader :params
  def initialize(params:)
    @params = params
  end

  def run
    Building.find(params[:building_id]) if params[:building_id]
  end
end
