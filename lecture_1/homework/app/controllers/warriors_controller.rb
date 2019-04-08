class WarriorsController < ApplicationController
  def index
    if params[:alive] == "true"
      warriors = clan.warriors.where("death_date is null")
    elsif params[:alive] == "false"
      warriors = clan.warriors.where("death_date is not null")
    else 
      warriors = clan.warriors
    end      
    render json: warriors.to_json(only: %w[name armour battles join_date death_date])
  end
  
  def show
    render json: warrior.to_json(only: %w[name armour battles join_date death_date])
  end

  def create
    warrior = clan.warriors.new(warrior_params)
    if warrior.save
      render json: warrior.to_json(only: %w[name armour battles join_date death_date]), status: 201
    else
      render json: { errors: warrior.errors.messages }, status: 422 
    end
  end

  def update
    if warrior.update(warrior _params)
      render json: warrior.to_json(only: %w[name armour battles join_date death_date]), status: 201
    else
      render json: { errors: warrior.errors.messages }, status: 422 
    end 
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