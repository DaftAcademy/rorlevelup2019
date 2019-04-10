class Magical < Weapon
  def calculate_damage(distance)
    damage * 2 * (distance / range)
  end
end
