# frozen_string_literal: true

class ClansController < ApplicationController
  # GET /clans
  def index
    render json: clan_json(Clan.all)
  end

  # GET /clans/id
  def show
    render json: clan_json(clan), include: [:warriors]
  end

  # POST /clans
  def create
    clan = ClansCreator.new(clan_params).call
    render json: clan_json(clan), status: 201
  end

  private

  def clan_json(clan)
    @serializer ||= ClanSerializer.new(clan)
    return @serializer.serialized_json
  end

  def clan
    @clan ||= (Clan.find_by(id: params[:id]) || NullClan.new)
  end

  def clan_params
    ClanParams.new(params).get
  end

end
