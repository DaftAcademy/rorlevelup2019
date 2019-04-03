module Clans
  class WarriorsController < ApplicationController
    def show
      json_response(@warrior)
    end

    def index
      warriors = clan.warriors
      if params.key?(:alive)
        if params[:alive].to_i == 0
          json_response(warriors.dead)
        else
          json_response(warriors.alive)
        end
      else
        json_response(warriors)
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: warrior.to_json, status: 201
      json_response(warrior, 201)
    end

    def update
      warrior.update!(warrior_params)

      json_response(warrior)
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
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date)
    end
  end
end
