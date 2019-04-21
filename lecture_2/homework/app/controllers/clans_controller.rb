class ClansController < ApplicationController
  def index
    render json: Clan.all, each_serializer: ClanSerializer
  end

  def create
    clan = Clan.create!(clan_params)

    render json: clan.to_json, status: 201
  end

  private

  def clan_params
    params.permit(:name)
  end
end
