# frozen_string_literal: true

# Stworzenie trzeciej opcji broni dla kind => :magical
# Warrior ma dopuszczone tylko trzy typy broni: melee, ranged i magical, co wymagalo dodania
# adekwatnych wymagan dla Mercenary - ma to swoje konsekwencje w weapon_creator.rb
# (else moze dotyczyc tylko broni magicznej)

module Weapons
  class MagicWand < Weapon
    attribute :kind, :string, default: :magical

    def calculate_damage(distance)
      distance < range ? damage : damage / 5
    end
  end
end
