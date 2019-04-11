# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior, include: %i[weapon building]
    end

    def index
      # Kod przez Was zaproponowany nie dziala, stad zmiana
      warriors = clan.warriors
      if params.key?(:alive)
        render json: warriors.alive
      elsif params.key?(:dead)
        render json: warriors.dead
      else
        other_cases
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: warrior.to_json, include: %i[weapon building], status: 201
    end

    def update
      warrior.update!(warrior_params)

      render json: warrior, include: %i[weapon building]
    end

    def destroy
      warrior.destroy!
    end

    private

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def warrior
      @warrior ||= clan.warriors.find(params[:id])
    end

    def warrior_params
      params.permit(:name,
                    :death_date,
                    :armor_quality,
                    :number_of_battles,
                    :join_date,
                    :building_id)
    end

    def other_cases
      if request.query_string == ''
        render json: warriors
      else
        render json: { message: 'Your query in not valid' }, status: 400
      end
    end
  end
end
