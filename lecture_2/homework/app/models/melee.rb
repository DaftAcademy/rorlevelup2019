class Melee < Weapon
  validates :range, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 2 }

  def calculate_damage(distance)
    distance > range ? 0 : damage * (1 - distance / range)
  end
end
