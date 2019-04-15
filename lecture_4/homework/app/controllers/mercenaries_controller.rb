# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    render json: Mercenary.available
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    mercenary = Mercenary.available.price_asc.exp_desc.first
    clan = find_clan
    building = find_building
    warrior_class = WarriorClassFinder.new(relation: clan.warriors).call
    warrior = WarriorCreator.new(relation: warrior_class,
                                 clan: clan,
                                 building: building,
                                 mercenary: mercenary).call

    render json: warrior, include: [:mercenary], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now

    clan = find_clan
    building = find_building
    warrior_class = WarriorClassFinder.new(relation: clan.warriors).call
    warrior = WarriorCreator.new(relation: warrior_class,
                                 clan: clan,
                                 building: building,
                                 mercenary: mercenary).call

    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
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
