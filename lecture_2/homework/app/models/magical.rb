class Magical < Weapon
  def calculate_damage(distance)
    dmg = -((distance - range).abs) + damage
    return 0 if distance < 1 || dmg < 0
    dmg
  end
end
