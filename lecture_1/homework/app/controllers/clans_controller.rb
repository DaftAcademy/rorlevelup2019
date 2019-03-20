class ClansController < ApplicationController
  # GET /clans
  def index
    json_response(as_json(clans))
  end

  # POST /clans
  def create
    clan = Clan.create!(clan_params)
    json_response(as_json(clan), :created)
  end

  # GET /clans/:id
  def show
    json_response(clan)
  end

  private

  def as_json(clan)
    clan.to_json(only: %w[id name])
  end

  def clan_params
    params.permit(:name)
  end

  def clan
    @clan ||= Clan.find(params[:id])
  end

  def clans
    @clans ||= Clan.all
  end
end
