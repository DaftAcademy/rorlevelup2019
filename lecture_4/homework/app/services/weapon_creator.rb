# frozen_string_literal: true

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
