class ClansController < ApplicationController
  def index
    clans = Clan.all
    render json: clans.to_json(only: %w[id name])
  end

  def create
    clan = Clan.new(clans_params)
    if clan.save
      render json: clan.to_json(only: %i[od name]), status: 201
    else
      render json: { error: clan.errors }, status: 422
    end
  end

  def clans_params
    params.permit(:name)
  end
end
