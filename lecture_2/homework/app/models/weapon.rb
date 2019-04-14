class Weapon < ApplicationRecord
  belongs_to :character, optional: false
  def calculate_damage(distance)
    return 0 
  end
end
