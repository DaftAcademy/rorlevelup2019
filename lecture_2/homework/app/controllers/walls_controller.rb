class WallsController < ApplicationController
    def index
        render json: Wall.all
    end
    
    def show
        render json: wall
    end

    def create
        wall = Wall.create!(wall_params)
    
        render json: wall, status: 201
    end

    def update
        wall.update!(wall_params)

        render json: wall
    end

    def destroy
        wall.destroy!
    end
    
    private
    
    def wall
        @wall ||= Wall.find(params[:id])
    end

    def wall_params
        params.permit(:name, :height, :thickness, :strength)
    end
end
