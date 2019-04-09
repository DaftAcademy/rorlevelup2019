class Sword < Weapon
  def calculate_damage(distance)
    return 0 if distance > range

    damage * rand(0.1...1.0)
  end
end
