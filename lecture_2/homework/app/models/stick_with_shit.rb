# frozen_string_literal: true

class StickWithShit < Weapon
  def calculate_damage(distance)
    effect = damage
    effect = 0 if distance > range
    effect
  end
end
