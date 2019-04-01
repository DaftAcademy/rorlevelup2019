class Melee < Weapon
  def calculate_damage(distance)
    return 0 if range < distance
    damage * (1 - distance/range)
  end
end
