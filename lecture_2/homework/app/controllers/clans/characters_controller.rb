module Clans
  class CharactersController < ApplicationController
    def index
      characters = clan.characters.all
      if params.key?(:alive)
        if params[:alive].to_i == 0
          render json: characters.dead.to_json
        else
          render json: characters.alive.to_json
        end
      else
        render json: characters.to_json
      end
    end

    def create
      character = clan.characters.create!(character_params)
	  render json: character.to_json, status: 201
      rescue ActiveRecord::ActiveRecordError => e
        render json: e.to_json, status: 422
    end
	
	def show
      render json: character.to_json
    end

    def update
	  character.update!(character_params)
	  render json: character.to_json, status: 201
	  rescue ActiveRecord::ActiveRecordError => e
        render json: e.to_json, status: 422
    end
	
    def destroy
      character.destroy!
      head 204
      rescue ActiveRecord::ActiveRecordError => e
        render json: e.to_json, status: 404
    end

    private

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def character
      @character ||= Character.find_by!(id: params[:id], clan_id: params[:clan_id])
    end
	
#	def character
#	  clan.characters.find(params[:id])
#   end

    def character_params
      params.permit(:name, :armour_rating, :battle_count, :join_date, :death_date)
    end
  end
end