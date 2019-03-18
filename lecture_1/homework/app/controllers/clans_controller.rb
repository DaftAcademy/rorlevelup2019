class ClansController < ApplicationController

  def create
    clan = Clan.new(params.require(:clan).permit(:name))
  end

  def index
    clans = Clan.all
    render json: clans.to_json(only: %w[id name])
  end

end