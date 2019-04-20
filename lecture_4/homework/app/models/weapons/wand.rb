# frozen_string_literal: true

module Weapons
  class Wand < Weapon
    attribute :kind, :string, default: :magical

    def calculate_damage(distance)
      distance < range ? damage : 0
    end
  end
end
