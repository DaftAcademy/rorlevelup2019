class ClansController < ApplicationController
  def index
    json_response(Clan.all)
  end

  def create
    clan = Clan.create!(clan_params)

    json_response(clan, 201)
  end

  private

  def clan_params
    params.permit(:name)
  end
end
