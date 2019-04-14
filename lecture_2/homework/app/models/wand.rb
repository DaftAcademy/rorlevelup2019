# frozen_string_literal: true

class Wand < Weapon
  def calculate_damage(distance)
    return 0 if distance > range

    damage
  end
end
