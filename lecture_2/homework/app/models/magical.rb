class Magical < Weapon
  def calculate_damage(distance)
    # Magic works only if distance is even. Totally makes sense.
    return 0 if distance.isodd?
  
    damage * (1 - distance / range)
  end
end
