class Katana < Weapon

  def kind
    :melee
  end

  def calculate_damage(distance)
    return 0 if distance > range
  
    damage * (1 - distance / range)
  end

end
