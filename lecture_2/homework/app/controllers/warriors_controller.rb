
  class WarriorsController < ApplicationController
    def show
      render json: warrior
    end

    def index
      if params.has_key?(:clan_id)
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
      elsif has_defensible_key
      else
        render json: Warrior.all
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

    def has_defensible_key
      if params.has_key?(:wall_id)
        render json: Wall.find_by(id: params[:wall_id]).warriors 
        return true
      end
      if params.has_key?(:tower_id)
        render json: Tower.find_by(id: params[:tower_id]).warriors
        return true
      end
      if params.has_key?(:gate_id)
        render json: Gate.find_by(id: params[:gate_id]).warriors
        return true
      end
      if params.has_key?(:fortress_id)
        render json: Fortress.find_by(id: params[:fortress_id]).warriors
        return true
      end
      return false
    end

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def warrior
      @warrior ||= Warrior.find(params[:id])
    end

    def warrior_params
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date, :defensible_type, :defensible_id, :clan_id)
    end
  end
