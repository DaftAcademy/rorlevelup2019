# frozen_string_literal: true

class CreateGoodWeaponService
  attr_reader :mercenary

  def initialize(mercenary)
    @mercenary = mercenary
  end

  def call
    case @mercenary.preferred_weapon_kind
    when 'magical'
      Weapons::Wand.create!(warrior: @mercenary.warrior, range: 40, damage: 10)
    when 'ranged'
      Weapons::Musket.create!(warrior: @mercenary.warrior, range: 40, damage: 10)
    when 'meele'
      Weapons::Katana.create!(warrior: @mercenary.warrior, range: 2, damage: 25)
  end
  end
end
