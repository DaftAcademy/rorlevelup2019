# frozen_string_literal: true

class ClansController < ApplicationController
  def index
    render json: serializer.new(Clan.all)
  end

  def create
    clan = Clan.create!(clan_params)

    render json: serializer.new(clan), status: 201
  end

  private

  def serializer
    ClanSerializer
  end

  def clan_params
    params.permit(:name)
  end
end
