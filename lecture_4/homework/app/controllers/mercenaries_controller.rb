# frozen_string_literal: true

class MercenariesController < ApplicationController
  def index
    render json: MercenariesQuery.all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    clan = find_clan
    building = find_building
    warrior = MercenaryToWarrior.new.call(clan: clan, building: building)
    render json: warrior, include: [:mercenary], status: :created
  end

  def employ
    return unless MercenariesQuery.available

    clan = find_clan
    building = find_building
    warrior = MercenaryToWarrior.new(mercenary: mercenary).call(clan: clan, building: building)
    render json: warrior, include: [:mercenary], status: :created
  end

  private

  def mercenary
    @mercenary ||= MercenariesQuery.find(id: params[:id]) || NullMercenary.new
  end

  def find_building
    Building.find(params[:building_id]) if params[:building_id]
  end

  def find_clan
    if params[:clan_id]
      Clan.find(params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
