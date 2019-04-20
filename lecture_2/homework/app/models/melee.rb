class Melee < Weapon
  belongs_to :warrior

  validate :proper_warrior

  def calculate_damage(distance)
    return 0 if distance < min_range || distance > max_range
    damage
  end

  private

  def proper_warrior
    if warrior.type == "Wizard" || warrior.type == "Archer"
      errors.add(:expiration_date, "You can pass melee weapon only to the Samurai or Hussar")
    end
  end

end