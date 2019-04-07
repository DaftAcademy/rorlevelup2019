class WeaponsController < ApplicationController
  def show
    render json: weapon, include: 'warrior'
  end

  def index
    render json: warrior.weapon, include: 'warrior'
  end

  def create
    weapon = Weapon.create!(wars_params)
    render json: weapon, include: 'warrior'
  end

  def update
    weapon.update!(wars_params)
    render json: weapon, include: 'warrior'
  end

  def destroy
    weapon.destroy!
    render head:204
  end

  private

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def warrior
    @warrior ||= Clan.warriors.find(params[:warrior_id])
  end

  def weapon
    @weapon ||= Weapon.find(params[:id])
  end

  def wars_params
    params.permit(:name, :type, :damage, :range, :warrior_id)
  end
end
