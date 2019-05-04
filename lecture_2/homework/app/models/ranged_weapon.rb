class MeleeWeapon < Weapon
  def calculate_damage(distance)
    return 0 if distance > range
    damage * damage
  end
end
