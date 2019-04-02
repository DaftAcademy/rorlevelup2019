class Ranged < Weapon
  belongs_to :warrior, class_name: "Archer"

  def calculate_damage(distance)
    return 0 if distance < min_range || distance > max_range
    damage + (damage/distance)
  end
end