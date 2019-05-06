class Magical < Weapon
  validates :range, numericality: { only_integer: true, greater_than: 5, less_than_or_equal_to: 15 }

  def calculate_damage(distance)
    distance > range ? 0 : damage * rand(1) * (1 - distance / range)
  end
end
