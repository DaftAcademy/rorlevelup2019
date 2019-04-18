# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior, include: %i[weapon building]
    end

    def index
      warriors = clan.warriors

      if params.key?(:alive)
        if params[:alive].to_i.zero?
          render json: warriors.dead
        else
          render json: warriors.alive
        end
      else
        render json: warriors
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
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date)
    end
  end
end
