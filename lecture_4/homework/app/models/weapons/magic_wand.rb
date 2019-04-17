# frozen_string_literal: true

module Weapons
  class MagicWand < Weapon
    attribute :kind, :string, default: :magical

    def calculate_damage(distance)
      distance < range ? damage * 3 : damage * 0.05
    end
  end
end
