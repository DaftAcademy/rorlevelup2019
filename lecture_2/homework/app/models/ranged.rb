class Ranged < Weapon
  def calculate_damage(distance)
    return 0.5 if distance < range

    damage * (distance - 10)
  end
end
