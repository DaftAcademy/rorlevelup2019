class Magical < Weapon
  def calculate_damage(distance)
    return 0 if range < distance
    damage * (1 - (1/2 - distance/range).abs)
  end
end
