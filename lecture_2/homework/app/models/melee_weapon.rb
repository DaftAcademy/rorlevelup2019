# frozen_string_literal: true

class MeleeWeapon < Weapon
  belongs_to :me_wpnable, polymorphic: true
  def calculate_damage(distance)
    distance = distance.abs
    range = range.abs
    return 0 if distance > range

    damage * (1 - distance / range)
  end
end
