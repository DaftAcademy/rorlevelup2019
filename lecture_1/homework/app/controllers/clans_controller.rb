class ClansController < ApplicationController
  before_action :clan, only: [:show]

  def index
    clans = Clan.all
    render json: clans.to_json(only: %i[id name])
  end

  def create
    clan = Clan.create!(clan_params)
    if clan.save
      render json: clan.to_json(only: %i[id name]),
             status: 201
    else
      render json: { errors: clan.errors }, status: 422
    end
  end


  private
  def clan
    clan ||= Clan.find(clan_params[:id])
  end

  def clan_params
    params.permit(:name, :id)
  end

end
