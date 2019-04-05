module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior, include: %i[clan weapon]
    end

    def index
      warriors = clan.warriors
      if params.key?(:alive)
        if params[:alive].to_i == 0
          render json: warriors.dead, include: %i[clan weapon]
        else
          render json: warriors.alive, include: %i[clan weapon]
        end
      else
        render json: warriors, include: %i[clan weapon]
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: warrior, include: %i[clan weapon], status: 201
    end

    def update
      warrior.update!(warrior_params)

      render json: warrior, include: %i[clan weapon]
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
      params.permit(:name, :death_date, :armor_quality, :number_of_battles,
                    :join_date, :defensible_type, :defensible_id)
    end
  end
end
