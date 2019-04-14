# frozen_string_literal: true

class Ranged < Weapon
  def calculate_damage(distance)
    return 0 if ((distance > 2*range) || (distance < 0.5*range))
    if distance > range  
      damage * (distance - range)
    if distance < range
      damage * (range - distance)
    else
      damage
    end
  end
end
