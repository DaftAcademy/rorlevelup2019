class WeaponsController < ApplicationController
    def index
        if params.has_key?(:warrior_id)
            render json: warrior.weapon.to_json  
        else
            render json: Weapon.all.to_json
        end
    end
    
    def show
        render json: weapon.to_json
    end

    def create
        weapon = warrior.weapon.create!(weapon_params)
    
        render json: weapon.to_json, status: 201
    end

    def update
        weapon.update!(weapon_params)

        render json: weapon.to_json
    end

    def destroy
        weapon.destroy!
    end
    
    private
    
    def warrior
        @warrior ||= Warrior.find(params[:warrior_id])
    end

    def weapon
        @weapon ||= Weapon.find(params[:id])
    end

    def weapon_params
        params.permit(:name, :range, :damage, :warrior_id)
    end
end
