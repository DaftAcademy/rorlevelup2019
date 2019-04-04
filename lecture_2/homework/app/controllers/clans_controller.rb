# frozen_string_literal: true

class ClansController < ApplicationController
  def index
    render json: Clan.all
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan
  end

  def show
    render json: clan, include: 'warriors'
  end

  private

  def clan_params
    params.permit(:name)
  end

  def clan
    @clan ||= Clan.find(params[:id])
  end

  def clan_params
    params.premit(:name)
  end
end
