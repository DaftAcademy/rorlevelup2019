module Clans
  class WeaponsController < ApplicationController

    def index
      weapon = Weapon.all
      render json: weapon
    end

    def create
      weapon = warrior.create_weapon(weapon_params)
      render json: weapon, status: 201
    end

    private

    def warrior
      @warrior ||= Warrior.find_by!(id: params[:warrior_id])
    end

    def weapon_params
      params.permit(:name, :type, :range, :damage)
    end

  end
end
