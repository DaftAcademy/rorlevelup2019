# frozen_string_literal: true

module Weapons
  class Staff < Weapon
    attribute :kind, :string, default: :magical

    def calculate_damage(distance)
      damage * (1 - distance / range)
    end
  end
end
