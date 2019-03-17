class ClansController < ApplicationController

  def index
    limit = params[:limit].to_i
    clans = limit.nil? ? Clan.first(5) : Clan.first(limit) #FIXME: alternative static version if paremeter wasnt provided doest work [empty array is returned]
    render json: clans.to_json(only: %w[name id])
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json(only: %w[name]), status: 201
  end

  private

  def clan_params
    params.permit(:name)
  end

end
