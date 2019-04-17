# frozen_string_literal: true

class WarriorCreator
  attr_reader :warriors, :mercenary, :building, :clan

  def initialize(relation:, mercenary:, building:, clan:)
    @warriors = relation
    @mercenary = mercenary
    @building = building
    @clan = clan
  end

  def call
    warrior = create_warrior
    create_good_weapon
    warrior
  end

  private

  def create_warrior
    warriors.create!(name: mercenary.name,
                     clan: clan,
                     building: building,
                     preferred_weapon_kind: mercenary.preferred_weapon_kind,
                     mercenary: mercenary)
  end

  def create_good_weapon
    case mercenary.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    end
  end
end
