class StrongholdsController < ApplicationController

    def index
        render json: Stronghold.all
    end

    def show 
        render json: stronghold
    end

    def create
        stronghold=stronghold.create(stronghold_params)
    end



    private 

    def stronghold 
        @stronghold ||= stronghold.find(params[:id])
    end

    def stronghold_params 
        params.permit(:name)
    end

end
