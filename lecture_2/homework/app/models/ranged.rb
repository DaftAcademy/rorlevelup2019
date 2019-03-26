class Ranged < Weapon
  def calculate_damage
    damage*range*1000/2137
  end
end
