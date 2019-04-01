class Ranged < Weapon
  def calculate_damage(distance)
    return 0 if range < distance
    damage * (2*distance/range)
  end
end
