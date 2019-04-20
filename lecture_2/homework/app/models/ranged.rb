class Ranged < Weapon
  belongs_to :warrior

  validate :proper_warrior

  def calculate_damage(distance)
    return 0 if distance < min_range || distance > max_range
    damage + (damage/distance)
  end

  private

  def proper_warrior
    if warrior.type != "Archer"
      errors.add(:expiration_date, "You can pass ranged weapon only to the Archer")
    end
  end

end