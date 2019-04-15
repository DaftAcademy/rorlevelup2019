class ClansController < ApplicationController
  def index
    render json: Clan.all
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan, status: 201
  end
  
  def show
    render json: clan, status: 200
  end
  
  def update
    clan.update(clan_params)
	render json: clan, status: 201
  end
  
  def destroy
    clan.destroy!
    head 204
  end

  private
  
  def clan
    Clan.find(params[:id])
  end

  def clan_params
    params.permit(:name, :id)
  end
end