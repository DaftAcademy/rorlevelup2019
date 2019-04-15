module Weapons
  class NullWeapon < Weapon
    attribute :kind, :string, default: :melee

    def calculate_damage(distance)
      distance <= range ? damage : 0
    end

    def type
      "no weapon"
    end
  end
end
