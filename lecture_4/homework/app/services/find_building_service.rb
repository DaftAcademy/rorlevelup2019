# frozen_string_literal: true

# Service Object - common part for employ_best & employ (DRY)
class FindBuildingService
  def initialize(params)
    @params = params
  end

  def run
    Building.find(@params[:building_id]) if @params[:building_id]
  end
end
