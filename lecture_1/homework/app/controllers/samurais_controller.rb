class SamuraisController < ApplicationController
  
  def index
    samurais = clan.samurais.all
    render json: samurais.to_json(only: %i[id name armour battles])
  end

  def show
    render json: samurai.to_json()
  end

  def create
    samurai = clan.samurais.new(samurai_params)
    if clan.samurai.save
      render json: samurai.to_json(only: %i[id name armour]), status: 201
    else
      render json: { errors: samurai.errors }, status: 422
    end
  end

  def update
    samurai.update!(samurai_params)
    render json: samurai.to_json(only: %i[id name armour]), status: 201
  end

  def destroy
    samurai.destroy!
    render json: "You've destroyed #{samurai.name}!", status: 200
  end

  def alive
    samurais = clan.samurais.where('death_date = ?', 'null' )
    render json: samurais.to_json(only: %i[id name armour battles join_date])
  end

  def dead
    samurais = clan.samurais.where.not('death_date = ?', 'null' )
    render json: samurais.to_json(only: %i[id name armour battles join_date death_date])
  end

  private

  def samurai
    samurai ||= clan.samurais.find(params[:id])
  end

  def clan
    clan ||= Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :armour, :battles, :join_date, :death_date)
  end
end
