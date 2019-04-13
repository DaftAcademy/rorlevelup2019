# frozen_string_literal: true

module Warriors
  class Hussar < Warrior
    attribute :preferred_weapon_kind, :string, default: :ranged

    def attack
      "Hussar #{name} charged while yielding #{my_weapon.type.demodulize}"
    end
  end
end
