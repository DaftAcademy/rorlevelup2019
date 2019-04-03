class BarricadesController < ApplicationController

    # GET /barricades
    def index
      barricades = barricades
      render json: barricade_json(barricades)
    end

    # POST /barricades
    def create
      barricade = Barricade.create!(barricade_params)
      render json: barricade_json(barricade), status: 201
    end    
    
    def barricades
      @barricades ||= Barricade.all
    end

    def barricade_params
      params.permit(:name, :defense)
    end

    def barricade_json(barricade)
      @serializer ||= BarricadeSerializer.new(barricade)
      return @serializer.serialized_json
    end
end
