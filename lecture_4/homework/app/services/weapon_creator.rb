# frozen_string_literal: true

class WeaponCreator
  attr_accessor :mercenary

  def initialize(mercenary:)
    @mercenary = mercenary
  end

  def call
    case mercenary.preferred_weapon_kind.to_sym
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::Wand.create!(warrior: mercenary.warrior, range: 80, damage: 40)
    end
  end
end
