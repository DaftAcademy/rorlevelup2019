class Range < Weapon
  def calculate_damage(distance)
    if distance == 0
      return 0
    else
      return damage/2  if distance > range
      damage
    end
  end
end