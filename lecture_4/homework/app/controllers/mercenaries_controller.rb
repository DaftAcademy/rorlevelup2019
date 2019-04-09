# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    render json: mercenaries
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    best_mercenary = mercenaries.available.order(experience: :desc).first
    return unless best_mercenary

    clan = find_clan
    building = find_building
    warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
    warrior = warrior_class.create!(name: best_mercenary.name, clan: clan, building: building, preferred_weapon_kind: best_mercenary.preferred_weapon_kind, mercenary: best_mercenary)
    create_good_weapon(best_mercenary)

    render json: warrior, include: [:mercenary], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now

    clan = find_clan
    building = find_building
    warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    create_good_weapon(mercenary)

    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenaries
    @mercenaries ||= Mercenary.all
  end

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

  def find_building
    if params[:building_id]
      Building.find(params[:building_id])
    end
  end

  def find_clan
    if params[:clan_id]
      Clan.find(params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end

  def create_good_weapon(mercenary)
    case mercenary.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      # TODO: some default?
    end
  end
end
