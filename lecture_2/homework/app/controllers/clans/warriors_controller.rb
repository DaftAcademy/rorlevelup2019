module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior.to_json
    end

    def index
      warriors = clan.warriors
      if request.query_string == ""
        render json: warriors.to_json
      else
        if params.key?(:dead)
          render json: warriors.dead.to_json
        elsif params.key?(:alive)
          render json: warriors.alive.to_json
        else
          render json: {message: 'Wrong query parameter, you should use alive (when you ask about alive) or dead (when you ask about dead)'}, status: 400
        end        
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: warrior.to_json, status: 201
    end

    def update
      warrior.update!(warrior_params)

      render json: warrior.to_json
    end

    def destroy
      warrior.destroy!
    end

    private

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def warrior
      @warrior ||= Warrior.find_by!(id: params[:id], clan_id: params[:clan_id])
    end

    def warrior_params
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date, :type, :defensible_id, :defensible_type, :equipment_id, :equipment_type)
    end
  end
end
