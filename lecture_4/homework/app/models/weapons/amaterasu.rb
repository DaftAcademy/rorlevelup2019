# frozen_string_literal: true

module Weapons
  class Amaterasu < Weapon
    attribute :kind, :string, default: :magical

    def calculate_damage(distance)
      distance < range ? damage * damage : damage
    end
  end
end