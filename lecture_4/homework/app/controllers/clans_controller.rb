# frozen_string_literal: true

class ClansController < ApplicationController
  def index
    render json: ClansQueries.all_clans
  end

  def show
    render json: clan, include: [:warriors]
  end

  def create
    clan = ClansQueries.create_clan(clan_params: clan_params)

    render json: clan, include: [:warriors], status: 201
  end

  private

  def clan
    @clan ||= ClansQueries.find(clan_id: params[:id])
  end

  def clan_params
    params.permit(:name)
  end
end
