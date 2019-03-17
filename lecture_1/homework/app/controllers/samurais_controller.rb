class SamuraisController < ApplicationController
    
    def index
        render json: clan.samurais.all.to_json(only: %i[id name armor battles start death])
    end

    def alive 
        render json: clan.samurais.where(death:  "null").to_json
    end

    def kaput
        render json: clan.samurais.where.not(death: "null").to_json
    end

    def create
        begin samurai = clan.samurais.create!(samurai_params)
            render json: samurai.to_json 
        rescue => exception
            render json: exception.to_json, status: 422     
        end
    end

    def update
        begin samurai.update!(samurai_params)
            render json: samurai.to_json 
        rescue => exception
            render json: exception.to_json, status: 422  
        end
    end

    def destroy
        begin samurai.destroy!
            head 204
        rescue => exception
            render json: exception.to_json, status: 404 
        end
    end

    def show
        render json: samurai.to_json(only: %i[id name armor battles start death])
    end

    def samurai
        samurai ||= clan.samurais.find(params[:id])
    end
    
    def clan
        clan ||= Clan.find_by!(name: params[:clan_name])
    end
    
    def samurai_params
        params.permit(:id, :name, :armor, :battles, :start, :death)
    end
    
end

