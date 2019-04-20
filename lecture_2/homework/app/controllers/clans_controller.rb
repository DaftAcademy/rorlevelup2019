class ClansController < ApplicationController
  def index
    render json: Clan.all
  end

  def create
    clan = Clan.create!(clan_params)

    render json: clan, status: 201
  end

  def destroy
    clan.destroy!
  end

  private

  def clan_params
    params.permit(:name)
  end

  def clan
    @clan ||= Clan.find(params[:id])
  end

end
