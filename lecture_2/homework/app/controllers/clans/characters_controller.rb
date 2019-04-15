module Clans
  class CharactersController < ApplicationController
    def index
      characters = clan.characters.all
      if params.key?(:alive)
        if params[:alive].to_i == 0
          render json: characters.dead, include: ['clan', 'defensible'], status: 200
        else
          render json: characters.alive, include: ['clan', 'defensible'], status: 200
        end
      else
        render json: characters, include: ['clan', 'defensible'], status: 200
      end
    end

    def create
      character = clan.characters.create!(character_params)
	  render json: character, include: ['clan', 'defensible'], status: 201
    end
	
	def show
      render json: character, include: ['clan', 'defensible'], status: 200
    end

    def update
	  character.update!(character_params)
	  render json: character, status: 201
    end
	
    def destroy
      character.destroy!
      head 204
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