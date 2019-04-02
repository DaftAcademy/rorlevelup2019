module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior.to_json
    end

    def index
      warriors = clan.warriors
      samurais = warriors.where(type: "Samurai")
      hussars = warriors.where(type: "Hussar")
      archers = warriors.where(type: "Archer")
      if params.has_key?(:alive)
        render json: warriors.alive.to_json
      elsif params.has_key?(:dead)
        render json: warriors.dead.to_json
      elsif params.has_key?(:samurais)
        render json: samurais.to_json
      elsif params.has_key?(:hussars)
        render json: hussars.to_json
      elsif params.has_key?(:archers)
        render json: archers.to_json
      else
        if request.query_string == ""
          render json: warriors.to_json
        else
          render json: {message: "Please use alive or dead as an additional query"}, status: 400
        end
      end
    end

    def create
      warrior_new = clan.warriors.create!(warrior_params)
      render json: warrior_new.to_json, status: 201
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
