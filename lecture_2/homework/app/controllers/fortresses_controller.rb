class FortressesController < ApplicationController
    def index
        render json: Fortress.all
    end

    def show
        render json: fortress
    end
    
    def create
        fortress = Fortress.create!(fortress_params)
    
        render json: fortress, status: 201
    end

    def update
        fortress.update!(fortress_params)

        render json: fortress
    end

    def destroy
        fortress.destroy!
    end
    
    private
    
    def fortress
        @fortress ||= Fortress.find(params[:id])
    end

    def fortress_params
        params.permit(:name, :fosse)
    end
end
