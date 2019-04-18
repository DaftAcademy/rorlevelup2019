# frozen_string_literal: true

module Weapons
  class Spear < Weapon
    attribute :kind, :string, default: :magical

    def calculate_damage(distance)
      distance < range ? damage : damage / 3
    end
  end
end
