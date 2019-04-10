def BuildingFinder

  def initialize(params)
    @params = params
  end

  def run
    return Building.find(@params[:id]) if @params[:id]
    Building.first # Same as with clan finder what if there are no buildings
  end

end
