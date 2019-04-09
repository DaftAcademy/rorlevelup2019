class Weapon < ApplicationRecord
  belongs_to :character, optional: true
  def calculate_damage(distance)
    return 0 
  end
end
