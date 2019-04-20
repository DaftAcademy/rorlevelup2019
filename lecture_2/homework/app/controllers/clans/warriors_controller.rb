module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior, include: ["weapon", "clan"]
    end

    def index
      warriors = clan.warriors
      if params.has_key?(:alive)
        render json: warriors.alive
      elsif params.has_key?(:dead)
        render json: warriors.dead
      elsif params.has_key?(:samurais)
        render json: warriors.where(type: "Samurai")
      elsif params.has_key?(:hussars)
        render json: warriors.where(type: "Hussar")
      elsif params.has_key?(:archers)
        render json: warriors.where(type: "Archer")
      elsif params.has_key?(:wizards)
        render json: warriors.where(type: "Wizard")
      else
        if request.query_string == ""
          render json: warriors
        else
          render json: {message: "Your query in not valid"}, status: 400
        end
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)
      render json: warrior, status: 201
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
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date, :type, :defensible_type, :defensible_id, :warriro_id)
    end

  end
end
