class ClansController < ApplicationController
  def index
    render json: Clan.all
  end

  def show
    render json: clan
  end

  def create
    clan = Clan.create!(clan_params)

    render json: clan, status: 201
  end

  def update
    clan.update!(clan_params)

    render json: clan
  end

  def destroy
    clan.destroy!
  end

  private

  def clan
    @clan ||= Clan.find(params[:id])
  end

  def clan_params
    params.permit(:name)
  end
end
