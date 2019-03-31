class Melee < Weapon
  def calculate_damage(distance)
    return 0 if distance > range || distance < 1

    (damage * (1 - distance / range)).round(1)
  end
end
