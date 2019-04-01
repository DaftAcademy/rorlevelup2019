class Wand < Weapon
  def kind
    :magical
  end

  def calculate_damage(distance)
    return 0 if distance > range
  
    damage * (rand(distance))
  end
end
