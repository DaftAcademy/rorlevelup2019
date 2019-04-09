class Bow < Weapon
  def calculate_damage(distance)
    return 0 if distance < 2 and distance > range

    damage * (range / (distance * 1.4))
  end
end
