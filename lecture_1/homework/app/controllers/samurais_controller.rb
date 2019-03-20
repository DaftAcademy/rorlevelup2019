class SamuraisController < ApplicationController
  before_action :set_clan
  before_action :samurai

  def index
    samurais = clan.samurais.all
    render json: samurais.to_json(only: %i[id name armour battles])
  end

  def show
    render json: samurai.to_json()
  end

  def create
    clan ||= Clan.find(params[:clan_id])
    samurai = clan.samurais.create(samurai_params)
    if samurai.save
      render json: samurai.to_json(only: %i[:id name armour]),
             status: 201
    else
      render json: {errors: samurai.errors },
             status: 422
    end
  end

  def update
    if samurai.update!(samurai_params)
      render json: samurai.to_json(only: %i[id name armour]),
             status: 201
    else
      render json: {errors: samurai.errors},
             status: 422
    end
  end

  def alive
    samurais = clan.samurais.where('death_date = ?', 'null')
    render json: samurais.to_json(only: %i[id name armour battles join_date])
  end

  def death
    samurais = clan.samurais.where.not('death_date = ?', 'null')
    render json: samurais.to_json(only: %i[id name armour battles join_date death_date])
  end

  def destroy
    samurai.destroy!
    render json: "You are deleted #{samurai[:name]} Samurai".to_json, status: 200
  end



  private

  def set_clan
    clan ||= Clan.find(params[:clan_id])
  end

  def samurai
    clan ||= Clan.find(params[:clan_id])
    samurai ||= clan.samurais.find(params[:id])
  end

  def samurai_params
    params.permit(:name, :armour, :battles, :join_date, :death_date, :clan_id)
  end

end
