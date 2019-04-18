# frozen_string_literal: true

class WeaponCreator
  attr_accessor :mercenary

  def initialize(mercenary:)
    @mercenary = mercenary
  end

  def call(mercenary)
    case mercenary.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::Rod.create!(warrior: mercenary.warrior, range: 42, damage: 10)
    end
  end
end
