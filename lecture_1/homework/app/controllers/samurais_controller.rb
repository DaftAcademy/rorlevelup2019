class SamuraisController < ApplicationController
  def show
    render json: samurai.to_json(only: %w[id name protection battles join_date death_date clan_id])
  end

  def index
    samurais = clan.samurais.all

    render json: samurais.to_json(only: %w[id name protection battles join_date death_date clan_id])
  end

  def create
    samurai = Samurai.new(samurai_params)
    samurai.clan =clan
    if samurai.save
      render json: samurai.to_json(only: %w[id name protection battles join_date death_date clan_id]), status: 201
    else
      render json: { errors: samurai.errors.full_messages }, status: 422
    end
  end

  def update
    samurai.update(samurai_params)
    if samurai.save
      render json: samurai.to_json(only: %w[id name protection battles join_date death_date clan_id]), status: 200
    else
      render json: { errors: samurai.errors.full_messages }, status: 422
    end
  end

  def destroy
    samurai.destroy!

    head 204
  end

  private

  def samurai
    @samurai ||= clan.samurais.find(params[:id])
  end

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :protection, :battles, :join_date, :death_date, :clan_id)
  end
end
