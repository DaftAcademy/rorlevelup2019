class Meele < Weapon
  def calculate_damage
    damage*(1/range)
  end
end
