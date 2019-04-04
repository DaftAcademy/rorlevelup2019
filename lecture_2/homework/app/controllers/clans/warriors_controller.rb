module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior
    end

    def index
      warriors = clan.warriors
      samurais = warriors.where(type: "Samurai")
      hussars = warriors.where(type: "Hussar")
      archers = warriors.where(type: "Archer")
      wizards = warriors.where(type: "Wizard")
      if params.has_key?(:alive)
        render json: warriors.alive
      elsif params.has_key?(:dead)
        render json: warriors.dead
      elsif params.has_key?(:samurais)
        render json: samurais
      elsif params.has_key?(:hussars)
        render json: hussars
      elsif params.has_key?(:archers)
        render json: archers
      elsif params.has_key?(:wizards)
        render json: wizards
      else
        if request.query_string == ""
          render json: warriors
        else
          render json: {message: "Your query in not valid"}, status: 400
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
