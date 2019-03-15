class ClansController < ApplicationController

    # GET /clans
    def index
        clans = Clan.all
        render json: clans.to_json(only: %w[id name])
    end

    # POST /clans
    def create
        clan = Clan.create!(clan_params)
        render json: clan.to_json(only: %w[id name]), status: 201
    end

    private
    
    def clan
        Clan.find(params[:clan_id])
    end

    def clan_params
        params.permit(:name)
    end

end