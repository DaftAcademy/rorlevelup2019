# frozen_string_literal: true

class ClansController < ApplicationController
  def index
    clans = Clan.all
    render json: serialize_it(clans).serializable_hash, status: :ok
  end

  def show
    clan = Clan.find(params[:id])
    options = {}
    options[:include] = [:warriors]
    render json: ClanSerializer.new(clan, options).serializable_hash

  end

  def create
    clan = Clan.create!(clan_params)

    render json: serialize_it(clan), status: 201
  end

  private

  def serialize_it(options)
    ClanSerializer.new(options)
  end

  def clan_params
    params.permit(:name)
  end
end
