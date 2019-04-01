module Clans
  class WarriorsController < ApplicationController

    def show
      render json: warrior, include: "*."
    end

    def index
      if building
        warriors = building.warriors
      else
        warriors = clan.warriors
      end

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
      if building
        warrior = building.warriors.create!(warrior_params)
      else
        warrior = clan.warriors.create!(warrior_params)
      end

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
      @warrior ||= Warrior.find_by!(id: params[:id])
    end

    def weapon
      @weapon ||= warrior.weapon
    end

    def building
      if params.key?(:castle_id)
        @building ||= Castle.find(params[:castle_id])
      elsif params.key?(:barricade_id)
        @building ||= Barricade.find(params[:barricade_id])
      elsif params.key?(:stronghold_id)
        @building ||= Stronhold.find(params[:stronghold_id])
      elsif params.key?(:tower_id)
        @building ||= Tower.find(params[:tower_id])
      elsif params.key?(:wall_id)
        @building ||= Wall.find(params[:wall_id])
      end
      @building
    end

    def warrior_params
      if building
        params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date, :type, :clan_id)
      else
        params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date, :type, :defensible_type, :defensible_id)
      end
    end
  end
end
