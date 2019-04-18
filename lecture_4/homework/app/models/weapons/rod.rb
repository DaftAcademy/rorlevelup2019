# frozen_string_literal: true

module Weapons
  class Rod < Weapon
    attribute :kind, :string, default: :magical

    def calculate_damage(distance)
      distance < range ? damage * 2 : damage / 2 + 42
    end
  end
end
