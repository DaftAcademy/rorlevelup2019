# frozen_string_literal: true

module Weapons
  class Musket < Weapon
    attribute :kind, :string, default: :ranged

    def calculate_damage(distance)
      distance < range ? damage * 2 : damage / 2
    end
  end
end
