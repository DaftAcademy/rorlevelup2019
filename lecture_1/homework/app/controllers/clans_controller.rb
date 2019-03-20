class ClansController < ApplicationController
  def index
	clans = Clan.all
	render json: clans.to_json(only: %i[id name])
  end
  def show
    render json: clan.to_json(only: %i[id name])
  end
  def create
	clan = Clan.create!(clan_params)
	rendeender json: clan.to_json(only: %i[id name]), status: 201
    rescue ActiveRecord::ActiveRecordError => e
      render json: e.to_json, status: 422
  end
    private
  def clan
    Clan.find(clan_params[:id])
  end  
  def clan_params
    params.permit(:name, :id)
  end  
end







