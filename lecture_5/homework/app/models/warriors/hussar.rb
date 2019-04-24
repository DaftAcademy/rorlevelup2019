# frozen_string_literal: true

module Warriors
  class Hussar < Warrior
    attribute :preferred_weapon_kind, :string, default: :ranged
    before_create :give_him_horse

    def attack
      "Hussar #{name} charged while yielding #{weapon.type.demodulize}"
    end

    def give_him_horse
      self.horse = true
    end
  end
end
