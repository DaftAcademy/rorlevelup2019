class ClansController < ApplicationController

  def index
    clans = Clan.all
    render json: clans.to_json(only: [:name])
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json(only: [:name]), status: :created
  end

  private

    def clan_params
      params.permit(:name)
    end

end
