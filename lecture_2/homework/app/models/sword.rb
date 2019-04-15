# frozen_string_literal: true

class Sword < Weapon
  attribute :kind, :string, default: Weapon.kinds[:melee]

  def calculate_damage(distance)
    return 0 if distance > range

    damage * rand(0.1...1.0)
  end
end
