# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior.to_json
    end

    def index
      warriors = clan.warriors
      if params.key?(:alive)
        if params[:alive].to_i == 0
          render json: warriors.dead.to_json
        else
          render json: warriors.alive.to_json
        end
      else
        render json: warriors.to_json
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: warrior.to_json, status: :created
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
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date)
    end
  end
end
