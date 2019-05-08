class Magical < Weapon
  def calculate_damage(distance)
    return 0 if distance > range
    damage * (distance + range)
  end
end