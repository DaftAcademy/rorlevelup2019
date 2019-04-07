# frozen_string_literal: true

class ClansController < ApplicationController
  def index
    # json_response(Clan.all)
    options = {}
    options[:include] = [:warriors]
    json_response(ClanSerializer.new(Clan.all, options).serialized_json)
  end

  def create
    clan = Clan.create!(clan_params)

    json_response(ClanSerializer.new(clan).serialized_json, 201)
  end

  private

  def clan_params
    params.permit(:name)
  end
end
