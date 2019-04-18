class Ranged < Weapon
  def calculate_damage(distance)
    return 0 if distance > range
    f =( (range.to_f/2) - distance.to_f)**2/((range.to_f/2)**2)
    (damage * (1- f)).to_i
  end
end
