class Magical < Weapon
  def calculate_damage(distance)
    return 0 if distance > range * Random.rand(100)
    damage * Random.rand(100)
  end
end
