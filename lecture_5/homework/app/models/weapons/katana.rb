# frozen_string_literal: true

module Weapons
  class Katana < Weapon
    attribute :kind, :string, default: :melee

    def calculate_damage(distance)
      distance < range ? damage : 0
    end
  end
end
