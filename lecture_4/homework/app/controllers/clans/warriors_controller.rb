# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior, include: %i[weapon building mercenary]
    end

    def index
      warriors = WarriorsQueries.all_clans_warriors(clan: clan)

      if params.key?(:alive)
        if params[:alive].to_i.zero?
          render json: warriors.dead
        else
          render json: warriors.alive
        end
      else
        render json: warriors, include: [:mercenary]
      end
    end

    def create
      warrior = WarriorsQueries.create_warrior(warrior_params: warrior_params, clan: clan)

      render json: warrior.to_json, include: %i[weapon building], status: 201
    end

    def update
      WarriorsQueries.update_warrior(warrior: warrior, warrior_params: warrior_params)

      render json: warrior, include: %i[weapon building]
    end

    def destroy
      WarriorsQueries.destroy_warrior(warrior: warrior)
    end

    private

    def clan
      @clan ||= ClansQueries.find(clan_id: params[:clan_id])
    end

    def warrior
      @warrior ||= WarriorsQueries.find_warrior(clan: clan, warrior_id: params[:id])
    end

    def warrior_params
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date)
    end
  end
end
