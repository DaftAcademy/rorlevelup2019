# frozen_string_literal: true

class WarriorRecruiter
  attr_accessor :mercenary, :params
  def initialize(mercenary:, params:)
    @mercenary = mercenary
    @params = params
  end

  def call
    clan = find_clan
    building = find_building
    warrior_class = find_class(clan)

    warrior = warrior_class.create!(
      name: mercenary.name,
      clan: clan,
      building: building,
      preferred_weapon_kind: mercenary.preferred_weapon_kind,
      mercenary: @mercenary
    )
    create_good_weapon(@mercenary)
    warrior
  end

  private

  def find_class(clan)
    clan.warriors.select('type, count(type) as warriors_count')
        .group(:type).order('warriors_count ASC').first.class
  end

  def find_building
    Building.find(@params[:building_id]) if @params[:building_id]
  end

  def find_clan
    if @params[:clan_id]
      Clan.find(@params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end

  def create_good_weapon(mercenary)
    WeaponCreator.new(mercenary: mercenary).call
  end
end
