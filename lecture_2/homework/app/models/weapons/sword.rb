# frozen_string_literal: true

module Weapons
  class Sword < Weapon
    def calculate_damage(distance)
      effect = damage
      effect = 0 if distance > range
      effect
    end
  end
end
