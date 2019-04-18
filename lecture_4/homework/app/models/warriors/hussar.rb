# frozen_string_literal: true

module Warriors
  class Hussar < Warrior
    attribute :preferred_weapon_kind, :string, default: :ranged

    def attack
      weapon && attack_with_gun || NoWeapon.new.attack
    end

    private

    def attack_with_gun
      "Hussar #{name} charged while yielding #{weapon.type.demodulize}"
    end
  end
end
