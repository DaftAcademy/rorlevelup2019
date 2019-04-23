# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def show
      render json: warrior, include: %i[weapon building]
    end

    def index
      warriors = clan.warriors
      params_key = params[:alive]
      render_alive = params_key ? DeadOrAliveService.new(warriors, params_key).call : warriors

      render json: render_alive
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: warrior, include: %i[weapon building], status: 201
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
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date, :preferred_weapon_kind)
    end
  end
end
