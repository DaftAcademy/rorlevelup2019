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
      WeaponsQueries.create_katana(warrior: mercenary.warrior, relation: Weapons::Katana)
    when :ranged
      WeaponsQueries.create_musket(warrior: mercenary.warrior, relation: Weapons::Musket)
    else
      WeaponsQueries.create_magic_wand(warrior: mercenary.warrior, relation: Weapons::MagicWand)
    end
  end
end
