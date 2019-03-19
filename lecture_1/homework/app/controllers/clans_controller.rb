class ClansController < ApplicationController
  def index
    clans = Clan.first(params[:limit].to_i)
    render json: clans.to_json(only: %w[id name])
  end

  def create
    clan = Clan.new(clan_params)
    if clan.save
      render json: clan.to_json(only: %w[id name]), status: 201
    else
      render json: { errors: clan.errors.full_messages }, status: 422
    end
  end

  private
  def clan_params
    params.require(:clan).permit(:name)
  end
end
