class ClansController < ApplicationController

  def index
    limit = params.has_key?(:limit) ? params[:limit].to_i : 5
    clans = Clan.first(limit)
    render json: clans.to_json(only: %w[name id])
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json(only: %w[name]), status: 201
  end

  def dead
    clan = Clan.find(params[:clan_id])
    samurais = clan.samurais.where.not(deathtime: nil)
    render json: samurais.to_json(only: %i[id name armour joined_at deathtime])
  end

  private

  def clan_params
    params.permit(:name)
  end

end
