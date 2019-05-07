# frozen_string_literal: true

class ClansController < ApplicationController
  def index
    clans = Clan.all
    render json: clans.to_json, status: 200
  end

  def show
    render json: clan.to_json, status: 200
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json, status: 201
  rescue ActiveRecord::ActiveRecordError => e
    render json: e.to_json, status: 422
  end

  def update
    clan.update!(orc_params)
    render json: clan.to_json, status: 201
  rescue ActiveRecord::ActiveRecordError => e
    render json: e.to_json, status: 422
  end

  def destroy
    clan.destroy!
    head 204
	rescue ActiveRecord::ActiveRecordError => e
      render json: e.to_json, status: 404
  end

  private

  def clan
    @clan ||= Clan.find(clan_params[:id])
  end

  def clan_params
    params.permit(:name)
  end
end

