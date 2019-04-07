# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def show
      json_response(WarriorSerializer.new(warrior).serialized_json)
    end

    def index
      warriors = clan.warriors
      if params.key?(:alive)
        if params[:alive].to_i.zero? # clans/1/warriors?alive=0
          json_response(WarriorSerializer.new(warriors.dead).serialized_json)
        else # clans/1/warriors?alive=1
          json_response(WarriorSerializer.new(warriors.alive).serialized_json)
        end
      else
        json_response(WarriorSerializer.new(warriors).serialized_json)
      end
    end

    def create
      warrior = clan.warriors.create!(warrior_params)
      json_response(WarriorSerializer.new(warrior).serialized_json, 201)
    end

    def update
      warrior.update!(warrior_params)
      json_response(WarriorSerializer.new(warrior).serialized_json)
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
