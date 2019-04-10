class Wand < Weapon
  before_create :set_species

  def calculate_damage(distance)
    if  distance <= 2 || distance > range
      @effect = 0
    else
      calculate_luck(distance)
      @effect = (damage - (distance)) * @luck
    end
  end

  private

  def calculate_luck(distance)
    if rand(range) - distance >= 0 
      @luck = 1
    else
      @luck = 0
    end
  end

  def set_species
    self.species = "Magical"
  end
end
