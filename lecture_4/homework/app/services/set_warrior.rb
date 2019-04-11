# frozen_string_literal: true

class SetWarrior
  def initialize(mercenary, clan, building)
    @mercenary = mercenary
    @clan = clan
    @building = building
  end

  def set
    warrior_class = @clan.warriors.select('type, count(type) as warriors_count').group(:type)
                                  .order('warriors_count ASC').first.class
    warrior = warrior_class.create!(name: @mercenary.name,
                                    clan: @clan,
                                    building: @building,
                                    preferred_weapon_kind: @mercenary.preferred_weapon_kind,
                                    mercenary: @mercenary)
    WeaponCreator.new(@mercenary).call
    warrior
  end
end
