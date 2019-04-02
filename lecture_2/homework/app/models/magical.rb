class Magical < Weapon
  def calculate_damage(distance)
    damage * (1 - distance / range)
  end
end
