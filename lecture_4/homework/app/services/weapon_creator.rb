class WeaponCreator
    def initialize(mercenary)
        @mercenary = mercenary
    end

    def call
        create_weapon
    end

    private

    attr_reader :mercenary

    def create_weapon       
      case mercenary.preferred_weapon_kind
      when "melee"
        Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
      when "ranged"
        Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
      when "magical"
        Weapons::Magical.create!(warrior: mercenary.warrior, range: 15, damage: 20)
      else
      end
    end
end