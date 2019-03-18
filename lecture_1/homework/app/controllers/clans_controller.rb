class ClansController < ApplicationController

  def index
    limit = params.has_key?(:limit) ? params[:limit].to_i : 5
    clans = Clan.first(limit)
    render json: clans.to_json(only: clan_attributes), status: :ok
  end

  def create
    clan = Clan.new(clan_params)

    if clan.save
      render json: clan.to_json(only: clan_attributes), status: 201
    else
      render json: { errors: clan.errors.messages }, status: 422
    end
  end

  def dead
    clan = Clan.find(params[:clan_id])
    samurais = clan.samurais.where.not(died_at: nil)
    render json: samurais.to_json(only: %i[id name armour joined_at died_at battles_count])
  end

  private

  def clan_params
    params.permit(:name)
  end

  def clan_attributes
    %w[name id]
  end

end
