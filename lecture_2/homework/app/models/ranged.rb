class Ranged < Weapon
  validates :range, numericality: { only_integer: true, greater_than: 10, less_than_or_equal_to: 100 }

  def calculate_damage(distance)
    distance > range ? 0 : damage * (distance / range)
  end
end
