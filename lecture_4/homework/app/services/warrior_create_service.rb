# frozen_string_literal: true

# Service Object - common part for employ_best & employ (DRY)
class WarriorCreateService
  def initialize(mercenary, clan, building, warrior_class)
    @mercenary = mercenary
    @clan = clan
    @building = building
    @warrior_class = warrior_class
  end

  def run
    if @mercenary.present?
      warrior = @warrior_class.create!(name: @mercenary.name, clan: @clan, building: @building,
                                       preferred_weapon_kind: @mercenary.preferred_weapon_kind,
                                       mercenary: @mercenary)
      create_good_weapon(@mercenary)
      warrior
    else
      { message: 'No mercenaries, try latter' }
    end
  end

  private

  def create_good_weapon(mercenary)
    case mercenary.preferred_weapon_kind
    when 'melee'
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when 'ranged'
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::Spear.create!(warrior: mercenary.warrior, range: 30, damage: 15)
    end
  end
end
