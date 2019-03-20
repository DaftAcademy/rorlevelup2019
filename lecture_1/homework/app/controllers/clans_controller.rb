class ClansController < ApplicationController

  def index
    clans = Clan.all
    render json: clans.to_json(only: clan_attr)
  end
  
  #def show
  #  clans = Clan.find(params[:id])
  #  render json: clans.to_json(only: clan_attr)
  #end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json(only: clan_attr), status: 201
  end

  #def destroy
  #  Clan.destroy(params[:id])
  #  head 204
  #end

  private

  def clan_params
    params.permit(:name)
  end

  def clan_attr
    %w[id name]
  end

end
