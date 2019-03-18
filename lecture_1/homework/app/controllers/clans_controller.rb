class ClansController < ApplicationController

  def create
    clan = Clan.create!(params.permit(:name)) #.require(:clan) <- pro8l3m in POSTMAN
    render json: clan.to_json(only: %w[id name]), status: 201
  end

  def index
    clans = Clan.all
    render json: clans.to_json(only: %w[id name])
  end

end