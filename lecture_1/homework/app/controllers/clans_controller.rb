class ClansController < ApplicationController

  def create
    clan = Clan.new(params.require(:clan).permit(:name))
    if clan.save
      render json: clan.to_json(only: %w[id name]), status: 201
    else
      render json: { errors: clan.errors.messages }, status: 422 
    end
  end

  def index
    clans = Clan.all
    render json: clans.to_json(only: %w[id name])
  end

end