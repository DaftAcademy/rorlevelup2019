# frozen_string_literal: true

class MercenaryHelper
  def self.addToArmy(mercenary:, building:, clan:)
    assignClass(mercenary: mercenary)
    accommodate(mercenary: mercenary, building: building)
    assignClan(mercenary: mercenary, clan: clan)
    mercenary.warrior.save!
  end

  def self.accommodate(mercenary:, building:)
    mercenary.warrior.building = building
  end

  def self.assignClan(mercenary:, clan:)
    mercenary.warrior.clan = clan
  end

  def self.assignClass(mercenary:)
    if mercenary.preferred_weapon_kind.to_sym == :melee
      Warriors::Samurai.new(name: mercenary.name, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    else
      Warriors::Hussar.new(name: mercenary.name, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    end
  end

  def self.setContract(mercenary:, contract_len:)
    mercenary.available_from = if contract_len
                                 contract_len.to_i.day.from_now
                               else
                                 10.day.from_now
                               end
  end

  def self.create_good_weapon(mercenary:)
    case mercenary.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      # TODO: some default? as defauld nullWeapon
    end
 end
end
