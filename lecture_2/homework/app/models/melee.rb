# frozen_string_literal: true

class Melee < Weapon
  def calculate_damage(distance)
    return 0 if distance > range
    damage * (range - distance)
  end
end