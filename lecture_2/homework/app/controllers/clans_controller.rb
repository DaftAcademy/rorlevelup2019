class ClansController < ApplicationController
  def index
    render json: Clan.all, include: 'warriors'
  end

  def create
    clan = Clan.create!(clan_params)

    render json: clan, status: 201
  end

  private

  def clan_params
    params.permit(:name)
  end
end
