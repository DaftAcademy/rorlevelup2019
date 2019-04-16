class BuildingsController < ApplicationController

    # GET /buildings
    def index
        render json: building_json(Building.all)
    end

    # GET /buildings/id
    def show
        render json: building_json(building)
    end

    def building
        @building ||= (Building.find_by(id: params[:id]) || NullBuilding.new)
    end

    def building_json(building)
        @serializer ||= BuildingSerializer.new(building)
        return @serializer.serialized_json
    end

end
