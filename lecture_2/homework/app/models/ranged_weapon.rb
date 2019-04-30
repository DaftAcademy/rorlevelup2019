# frozen_string_literal: true

class RangedWeapon < Weapon
  belongs_to :ra_wpnable, polymorphic: true
  def calculate_damage(distance)
    distance = distance.abs
    range = range.abs
    return 0 if distance > range

    damage * (0.5 * distance / range + 0.25)
  end
end
