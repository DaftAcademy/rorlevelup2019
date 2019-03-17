class ClansController < ApplicationController
  def index
    clans = Clan.all
    render json: clans.to_json(only: %w[id name])
  end

  def show
    render json: clan.to_json(only: %w[id name])
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json(only: %w[name]), status: 201
  end

  def update
    clan.update!(clan_params)
    render json: clan.to_json(only: %w[name])
  end

  def destroy
    clan.destroy!

    head 204
  end
  
  private

  def clan
    @clan ||= Clan.find(params[:id])
  end

  def clan_params
    params.permit(:name)
  end
end
