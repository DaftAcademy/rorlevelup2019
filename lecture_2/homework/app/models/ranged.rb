class Ranged < Weapon
  def calculate_damage(distance)
    return 0 if distance > range
    return damage * 0.3 if distance < range * 0.1
    damage * (1 - distance / range)
  end
end
