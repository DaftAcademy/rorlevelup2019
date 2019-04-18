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
        if building.is_a?(NullBuilding)
            render json: siege_report_json(Reports::NullSiegeReport.new), status: 404
        else
            render json: siege_report_json(Reports::SiegeReport.new(building))
        end
    end

    def building
        @building ||= (Building.find_by(id: params[:id]) || NullBuilding.new)
    end

    def building_json(building)
        @serializer ||= BuildingSerializer.new(building)
        return @serializer.serialized_json
    end

    def siege_report_json(siege_report)
        @siege_serializer ||= Reports::SiegeReportSerializer.new(siege_report)
        return @siege_serializer.serialized_json
    end

end
