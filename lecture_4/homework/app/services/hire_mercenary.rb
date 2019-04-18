# frozen_string_literal: true

class HireMercenary
  attr_reader :mercenary, :params
  def initialize(params:, mercenary: Mercenary)
    @params = params
    @mercenary = mercenary
  end

  def call
    warrior = warrior_class.create!(
      name: mercenary.name,
      clan: clan,
      building: building,
      preferred_weapon_kind: mercenary.preferred_weapon_kind,
      mercenary: mercenary
    )
    create_weapon
    warrior
  end

  private

  def clan
    ClanFinder.new(params: params).run
  end

  def building
    BuildingFinder.new(params: params).run
  end

  def warrior_class
    WarriorClassSelector.new(clan: clan).run
  end

  def create_weapon
    MercenaryWeaponCreator.new(mercenary: mercenary).run
  end
end
