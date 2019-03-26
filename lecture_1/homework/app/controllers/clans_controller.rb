class ClansController < ApplicationController
  def show
    render json: clan.to_json(only: %w[id name])
  end

  def index
    clans = Clan.all
    render json: clans.to_json(only: %w[id name])
  end

  def create
    clan = Clan.new(clan_params)
    if clan.save
      render json: clan.to_json(only: %w[id name])
    else
      render json: { error: clan.errors }, status: 422
    end
  end

  def update
    if clan.update(clan_params)
      render json: clan.to_json(only: %w[id name])
    else
      render json: { error: clan.errors }, status: 422
    end
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
