# frozen_string_literal: true

class Sword < Weapon
  def calculate_damage(distance)
    distance < range ? damage * 2 : 0
  end
end
