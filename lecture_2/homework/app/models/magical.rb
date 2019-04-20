class Magical < Weapon
  belongs_to :warrior

  validate :proper_warrior

  def calculate_damage(distance)
    return 0 if distance < min_range || distance > max_range
    damage + (damage*3/distance)
  end

  private

  def proper_warrior
    if warrior.type != "Wizard"
      errors.add(:expiration_date, "You can pass magical weapon only to the Wizard")
    end
  end

end