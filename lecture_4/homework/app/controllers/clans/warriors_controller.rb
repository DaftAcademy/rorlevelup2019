# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior, include: %i[weapon building mercenary]
    end

    def index
      warriors = warrior_query
      if request.query_string == ''
        render json: warriors
      else
        query
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: warrior.to_json, include: %i[weapon building mercenary], status: 201
    end

    def update
      warrior.update!(warrior_params)

      render json: warrior, include: %i[weapon building mercenary]
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

    def warrior_query
      clan.warriors
    end

    def query
      warriors = warrior_query
      if params.key?(:dead)
        render json: warriors.dead
      elsif params.key?(:alive)
        render json: warriors.alive
      else
        render json: { message: 'Wrong query parameter' }, status: 400
      end
    end
  end
end
