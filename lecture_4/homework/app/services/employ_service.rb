# frozen_string_literal: true

class EmployService
  def initialize(clan_id, building_id, mercenary = nil)
    @clan_id = clan_id
    @building_id = building_id
    @mercenary = mercenary
  end

  def call
    clan = ClanFindService.new(@clan_id).call
    building = BuildingFindService.new(@building_id).call
    warrior_class = WarriorsQuery.new(clan.warriors).warrior_class
    warrior = warrior_class.create!(name: @mercenary.name,
                                    clan: clan,
                                    building: building,
                                    preferred_weapon_kind: @mercenary.preferred_weapon_kind,
                                    mercenary: @mercenary)
    CreateGoodWeaponService.new(@mercenary).call
    warrior
  end
end
