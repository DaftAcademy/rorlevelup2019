class ClansController < ApplicationController
  before_action :set_clan, only: [:show, :update, :destroy]

  def index
    @clans = Clan.all
    json_response(@clans)
  end

  def create
    @clans = Clan.create!(clan_params)
    json_response(@clans, :created)
  end

  def show
    json_response(@clan)
  end

  def update
    @clan.update(clan_params)
    json_response(@clan)
  end

  def destroy
    @clan.destroy
    json_response(@clan)
  end

  private

  def clan_params
    params.permit(:name, :d)
  end

  def set_clan
    @clan = Clan.find(params[:id])
  end
end
