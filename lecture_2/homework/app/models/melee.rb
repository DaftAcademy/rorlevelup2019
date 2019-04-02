class Melee < Weapon
  belongs_to :warrior, class_name: "Hussar", class_name: "Samurai"

  def calculate_damage(distance)
    return 0 if distance < min_range || distance > max_range
    damage
  end
end