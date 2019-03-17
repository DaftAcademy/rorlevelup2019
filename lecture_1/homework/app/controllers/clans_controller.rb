class ClansController < ApplicationController

    def index
        render json: Clan.all.to_json(only: %i[id name])
    end

    def create 
        begin clan = Clan.create!(clan_params)
            render json: clan.to_json 
        rescue => exception
            render json: exception.to_json, status: 422  
        end
    end

    def update
        begin clan.update!(clan_params)
            render json: clan.to_json 
        rescue => exception
            render json: exception.to_json, status: 422  
        end
    end

    def destroy
        begin clan.destroy!
        render json: clan.to_json 
        rescue => exception
            render json: exception.to_json, status: 404
        end
    end

    def show
        render json: clan.to_json(only: %i[id name])
    end

    def clan
        clan ||= Clan.find_by!(name: params[:name])
    end

    def clan_params
        params.permit(:name)
    end

end
