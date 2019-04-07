# frozen_string_literal: true

class ClansController < ApplicationController
  def index
    render json: Clan.all
  end

  def show
    render json: clan, include: [:warriors]
  end

  def create
    clan = Clan.create!(clan_params)

    render json: clan, include: [:warriors], status: 201
  end

  private

  def clan
    @clan ||= Clan.find(params[:id])
  end

  def clan_params
    params.permit(:name)
  end
end
