# frozen_string_literal: true

class Bow < Weapon
  before_create :set_species

  def calculate_damage(distance)
    if distance <= 2 || distance > range
      @effect = 0
    else
      calculate_luck(distance)
      @effect = (damage - distance) * @luck
    end
  end

  private

  def calculate_luck(distance)
    @luck = if rand(range) - distance >= 0
              1
            else
              0
            end
  end

  def set_species
    self.species = 'Ranged'
  end
end
