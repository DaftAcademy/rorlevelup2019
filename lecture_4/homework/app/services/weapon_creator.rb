# frozen_string_literal: true

class WeaponCreator
  def initialize(mercenary)
    @mercenary = mercenary
  end

  def call
    case @mercenary.preferred_weapon_kind
    when 'melee'
      Weapons::Katana.create!(warrior: @mercenary.warrior, range: 2, damage: 25)
    when 'ranged'
      Weapons::Musket.create!(warrior: @mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::MagicWand.create!(warrior: @mercenary.warrior, range: 100, damage: 50)
    end
  end
end
