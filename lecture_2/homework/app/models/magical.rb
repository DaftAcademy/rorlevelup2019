# frozen_string_literal: true

class Magical < Weapon
  def calculate_damage(distance)
    return 0 if distance > range

    2 * (damage * (1 - distance / range))
  end
end
