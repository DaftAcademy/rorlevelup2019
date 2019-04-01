class Magical < Weapon
  belongs_to :offensive, polymorphic: true
  
  def calculate_damage(distance)
    return 0 if distance > range

    2*(damage * (1 - distance / range))
  end
end
