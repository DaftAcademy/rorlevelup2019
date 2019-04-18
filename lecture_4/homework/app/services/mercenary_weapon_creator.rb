# frozen_string_literal: true

class MercenaryWeaponCreator
  attr_reader :mercenary
  def initialize(mercenary: Mercenary)
    @mercenary = mercenary
  end

  def run
    create_good_weapon
  end

  private

  def create_good_weapon
    case mercenary.preferred_weapon_kind
    when 'melee'
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when 'ranged'
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::Wand.create!(warrior: mercenary.warrior, range: 80, damage: 15)
    end
  end
end
