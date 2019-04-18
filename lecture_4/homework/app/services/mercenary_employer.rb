# frozen_string_literal: true

class MercenaryEmployer
  attr_accessor :mercenary, :params

  def initialize(mercenary:, params:)
    @mercenary = mercenary
    @params = params
  end

  def call
    clan = find_clan
    building = find_building
    warrior_class = select_class(clan)
    warrior = warrior_class.create!(
      name: mercenary.name,
      clan: clan,
      building: building,
      preferred_weapon_kind: mercenary.preferred_weapon_kind,
      mercenary: mercenary
    )
    create_good_weapon(mercenary)
    warrior
  end

  private

  def find_building
    Building.find_by(id: params[:building_id])
  end

  def find_clan
    ClanFinder.new(clan_id: params[:clan_id]).call
  end

  def create_good_weapon(mercenary)
    WeaponCreator.new(mercenary: mercenary).call
  end

  def select_class(clan)
    clan.warriors.select('type, count(type) as warriors_count')
        .group(:type).order('warriors_count ASC').first.class
  end
end
