# frozen_string_literal: true

module Weapons
  class Gun < Weapon
    attribute :kind, :string, default: :ranged

    def calculate_damage(distance)
      distance < range ? damage * 4 : damage / 2
    end
  end
end
