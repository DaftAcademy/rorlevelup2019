# frozen_string_literal: true

class Magical < Weapon
  def calculate_damage(distance)
    return 0 if distance > 5 * range

    dammage
  end
end
