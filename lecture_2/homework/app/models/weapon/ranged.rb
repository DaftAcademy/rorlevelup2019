class Ranged < Weapon
  def calculate_damage(distance)
    return 0 if distance > range
    damage**2 * (range - distance)
  end
end
