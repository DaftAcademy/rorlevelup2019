class WeaponsController < ApplicationController
  def index
    render json: Weapon.all.to_json
  end

  def create
    weapon = Weapon.create!(weapon_params)
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

  def weapon_params
    params.permit(:name, :type, :min_range, :max_range, :damage, :warrior_id)
  end

  def weapon
    @weapon ||= Weapon.find(params[:id])
  end

end