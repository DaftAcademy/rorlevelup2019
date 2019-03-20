class ClansController < ApplicationController
  # GET /clans
  def index
    json_response(clans.to_json(only: clan_attributes))
  end

  # POST /clans
  def create
    clan = Clan.create!(clan_params)
    json_response(clan.to_json(only: clan_attributes), :created)
  end

  # GET /clans/:id
  def show
    json_response(clan)
  end

  private

  def clan_attributes
    %i[id name]
  end

  def clan_params
    params.permit(:name)
  end

  def clan
    @clan ||= Clan.find(params[:id])
  end

  def clans
    @clans ||= Clan.first(limit)
  end
end
