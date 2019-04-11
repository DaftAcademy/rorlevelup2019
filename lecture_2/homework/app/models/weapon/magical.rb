class Magical < Weapon
  def calculate_damage(distance)
    damage * (distance/2 + range)
  end
end