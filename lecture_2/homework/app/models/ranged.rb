class Ranged < Weapon
  def calculate_damage(distance)
    return 0 if distance > range || distance.zero?

    if distance < range / 2
      damage * (distance / range)
    else
      damage * (1 - distance / range)
    end
  end
end
