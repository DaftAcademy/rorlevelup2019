# frozen_string_literal: true

class Cannon < Weapon
  def calculate_damage(distance)
    return 0 if (distance < 10) && (distance > range)

    damage * (range / (distance * 1.2))
  end
end