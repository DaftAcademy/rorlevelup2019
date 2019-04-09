class BuildingFinder
  attr_reader :params
  def initialize(params:)
    @params = params
  end

  def run
    if params[:building_id]
      Building.find(params[:building_id])
    end
  end
end