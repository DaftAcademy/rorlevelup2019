class BuildingsController < ApplicationController

    # GET /buildings
    def index
        render json: building_json(Building.all)
    end

    # GET /buildings/id
    def show
        render json: building_json(building)
    end

    # GET /buildings/id/siege_report
    def siege_report
        render json: siege_report_json(building)
    end

    def building
        @building ||= (Building.find_by(id: params[:id]) || NullBuilding.new)
    end

    def building_json(building)
        @serializer ||= BuildingSerializer.new(building)
        return @serializer.serialized_json
    end

    def siege_report_json(building)
        @siege_serializer ||= Reports::SiegeReportSerializer.new(Reports::SiegeReport.new(building))
        return @siege_serializer.serialized_json
    end

end
