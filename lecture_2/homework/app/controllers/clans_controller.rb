class ClansController < ApplicationController
  def index
    render json: Clan.all.to_json
  end

  def show
    render json: clan
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json, status: 201
  end

  private

  def clan_params
    params.permit(:name)
  end

  def clan
    @clan ||= Clan.find(params[:id])
  end
end
