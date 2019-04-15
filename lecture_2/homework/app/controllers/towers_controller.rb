class TowersController < ApplicationController
    def index
        render json: Tower.all
    end
    
    def show
        render json: tower
    end

    def create
        tower = Tower.create!(tower_params)
    
        render json: tower, status: 201
    end

    def update
        tower.update!(tower_params)

        render json: tower
    end

    def destroy
        tower.destroy!
    end
    
    private
    
    def tower
        @tower ||= Tower.find(params[:id])
    end

    def tower_params
        params.permit(:name, :height, :strength)
    end
end
