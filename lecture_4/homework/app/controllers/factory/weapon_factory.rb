# frozen_string_literal: true

module Factory
  class WeaponFactory
    def self.create(mercenary)
      case mercenary.preferred_weapon_kind
      when :melee
        Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
      when :ranged
        Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
      when :magical
        Weapons::Amaterasu.create!(warrior: mercenary.warrior, range: 100, damage: 100)
      else  
        #i guess should be some kind of null object here yet it would lead to other nils inside
      end
    end
  end
end
