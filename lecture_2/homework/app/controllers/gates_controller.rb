class GatesController < ApplicationController
    def index
        render json: Gate.all
    end
    
    def show
        render json: gate
    end

    def create
        gate = Gate.create!(gate_params)
    
        render json: gate, status: 201
    end

    def update
        gate.update!(gate_params)

        render json: gate
    end

    def destroy
        gate.destroy!
    end
    
    private
    
    def gate
        @gate ||= Gate.find(params[:id])
    end

    def gate_params
        params.permit(:name, :material, :thickness, :strength)
    end
end
