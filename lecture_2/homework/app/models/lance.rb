class Lance < Weapon
  def calculate_damage(distance)
    effect = damage
    effect = 0 if distance > range
    return effect
  end
end
