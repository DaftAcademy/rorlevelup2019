class Magical < Weapon
  belongs_to :warrior, class_name: "Wizard"
  def calculate_damage(distance)
    return 0 if distance < min_range || distance > max_range
    damage + (damage*3/distance)
  end
end