class WarriorsController < ApplicationController
  def index
    warriors = clan.warriors
    render json: warriors.to_json(only: %w[name armour battles join_date death_date])
  end
  
  def show
    render json: warrior.to_json (only: %w[name armour battles join_date death_date])
  end

  def create
    warrior = clan.warriors.create!(warrior_params)
    render json: warrior.to_json (only: %w[name armour battles join_date death_date])
  end

  def update
    warrior.update!(warrior_params)
    render json: warrior.to_json (only: %w[name armour battles join_date death_date])
  end

  def destroy
    warrior.destroy!
    head 204
  end

  private
  def warrior 
    clan.warriors.find(params[:id])
  end

  def clan
    Clan.find(params[:clan_id])
  end

  def warrior_params
    params.permit(:name, :armour, :battles, :join_date, :death_date)
  end
end