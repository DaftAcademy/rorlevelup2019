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
    best_mercenary = MercenariesQuery.find_best
    return unless best_mercenary

    clan = find_clan
    building = find_building
    warrior_class = WarriorsQueries.choose_class(clan: clan)
    warrior = WarriorsQueries.create_mercenary_warrior(warrior_class: warrior_class, mercenary: best_mercenary, clan: clan, building: building)
    create_good_weapon(best_mercenary)

    render json: warrior, include: [:mercenary], status: 201
  end

  def employ
    return unless MercenariesQuery.can_be_hired(mercenary_id: mercenary.id)

    clan = find_clan
    building = find_building
    warrior_class = WarriorsQueries.choose_class(clan: clan)
    warrior = WarriorsQueries.create_mercenary_warrior(warrior_class: warrior_class, mercenary: mercenary, clan: clan, building: building)
    create_good_weapon(mercenary)

    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenaries
    @mercenaries ||= MercenariesQuery.all_mercenaries
  end

  def mercenary
    @mercenary ||= MercenariesQuery.mercenary(mercenary_id: params[:id])
  end

  def find_building
    BuildingsQueries.find_building(id: params[:building_id])
  end

  def find_clan
    ClansQueries.find(clan_id: params[:clan_id])
  end

  def create_good_weapon(mercenary)
    case mercenary.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::MagicWand.create!(warrior: mercenary.warrior, range: 20, damage: 45)
    end
  end
end
