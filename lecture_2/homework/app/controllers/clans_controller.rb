class ClansController < ApplicationController
  def index
    clans = Clan.all
    render json: ClanSerializer.new(clans)
  end

  def create
    clan = Clan.create!(clan_params)
    render json: ClanSerializer.new(clan), status: 201
  end

  private

  def clan_params
    params.permit(:name)
  end
end
