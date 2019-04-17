# frozen_string_literal: true

class MercenaryRecruiter
  def self.call(mercenary:, params:)
    new(mercenary, params)
  end

  private

  attr_reader :params, :mercenary

  def initialize(mercenary, params)
    @mercenary = mercenary
    @params = params
    employ
  end

  def employ
    clan = ClanFinder.new(params: params[:clan_id]).call
    building = BuildingFinder.new(params: params[:building_id]).call
    warrior_class = WarriorsQueries.choose_class(clan: clan)

    WarriorsQueries.create_mercenary_warrior(
      warrior_class: warrior_class,
      mercenary: mercenary,
      clan: clan,
      building: building
    )
    WeaponCreator.new(mercenary: mercenary).call
  end
end

class ClanFinder
  def initialize(params:)
    @params = params
  end

  def call
    find_clan
  end

  private

  attr_reader :params

  def find_clan
    ClansQueries.find(clan_id: params)
  end
end

class BuildingFinder
  def initialize(params:)
    @params = params
  end

  def call
    find_building
  end

  private

  attr_reader :params

  def find_building
    BuildingsQueries.find_building(id: params)
  end
end

class WeaponCreator
  def initialize(mercenary:)
    @mercenary = mercenary
  end

  def call
    create_good_weapon
  end

  private

  attr_reader :mercenary

  def create_good_weapon
    case mercenary.preferred_weapon_kind.to_sym
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::MagicWand.create!(warrior: mercenary.warrior, range: 20, damage: 45)
    end
  end
end
