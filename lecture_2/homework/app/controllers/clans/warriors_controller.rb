# frozen_string_literal: true

module Clans
  class WarriorsController < ApplicationController
    def show
      options = {}
      options[:include] = [:defensible, :weapon]

      render json: WarriorSerializer.new(warrior, options)
    end

    def index
      warriors = clan.warriors
      options = {}
      options[:include] = [:defensible, :weapon]

      render json: WarriorSerializer.new(alive?(warriors), options)
    end

    def create
      warrior = clan.warriors.create!(warrior_params)

      render json: serialize_it(warrior), status: 201
    end

    def update
      warrior.update!(warrior_params)

      render json: serialize_it(warrior)
    end

    def destroy
      warrior.destroy!
    end

    private

    def serialize_it(options)
      WarriorSerializer.new(options)
    end
    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def warrior
      @warrior ||= Warrior.find_by!(id: params[:id], clan_id: params[:clan_id])
    end

    def alive?(warriors)
     if params.key?(:alive)
       if params[:alive].to_i == 0
         warriors.dead
       else
         warriors.alive
       end
     else
       warriors
     end
    end

    def warrior_params
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date, :kind, :attack, :equipment, :defensible_id, :defensible_type)
    end
  end
end
