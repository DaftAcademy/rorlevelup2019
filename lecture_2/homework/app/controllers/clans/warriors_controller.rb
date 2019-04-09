module Clans
  class warriorsController < ApplicationController
    def show
      render json: warrior
    end

    def index
      warriors = clan.warriors
      if params.key?(:alive)
        if params[:alive].to_i == 0
          render json: warriors.dead
        else
          render json: warriors.alive
        end
      else
        render json: warriors
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: warrior, status: 201
    end

    def update
      warrior.update!(warrior_params)

      render json: warrior
    end

    def destroy
      warrior.destroy!
    end

    private

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def warrior
      @warrior ||= warrior.find_by!(id: params[:id], clan_id: params[:clan_id])
    end

    def warrior_params
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date)
    end
  end
end
