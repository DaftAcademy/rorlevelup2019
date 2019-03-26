class ClansController < ApplicationController
  before_action :set_clan, only: [:show, :update, :destroy]

  # GET /clans
  def index
    @clans = Clan.all
    json_response(@clans)
  end

  # POST /clans
  def create
    @clan = Clan.create!(clan_params)
    @clan ? json_response(@clan, :created) : json_response('Error', :unprocessable_entity)
  end

  private

  def clan_params
    params.permit(:name)
  end

  def set_clan
    @clan = Clan.find(params[:id])
  end
end
