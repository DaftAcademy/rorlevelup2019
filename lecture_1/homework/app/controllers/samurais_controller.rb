class SamuraisController < ApplicationController

  def index
    if params[:alive].present?
      if params[:alive].to_i == 0
        render json: clan.samurais.dead.to_json(only: %w[id clan_id name armor_quality battle_count join_date death_date])
      else
        render json: clan.samurais.alive.to_json(only: %w[id clan_id name armor_quality battle_count join_date death_date])
      end
    else
      render json: clan.samurais.to_json(only: %w[id clan_id name armor_quality battle_count join_date death_date])
    end
  end

  def show
    render json: samurai.to_json(only: %w[id clan_id name armor_quality battle_count join_date death_date])
  end

  def create
    samurai = clan.samurais.new(samurai_params)
    if samurai.save
      render json: samurai.to_json(only: %w[id clan_id name armor_quality battle_count join_date death_date])
    else
      render json: {error: samurai.errors}, status: 422
    end
  end

  def update
    if samurai.update(samurai_params)
      render json: samurai.to_json(only: %w[id clan_id name armor_quality battle_count join_date death_date])
    else
      render json: {error: samurai.errors}, status: 422
    end
  end

  def destroy
    samurai.destroy!
    head 204
  end

  private

  def clan
    clan = Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :armor_quality, :battle_count, :death_date, :join_date, )
  end

  def samurai
    samurai = clan.samurais.find_by!(id: params[:id]) if clan
  end
end
