# frozen_string_literal: true

module Warriors
  class Samurai < Warrior
    attribute :preferred_weapon_kind, :string, default: :melee

    def attack
      weapon && attack_with_gun || NoWeapon.new.attack
    end

    private

    def attack_with_gun
      "Samurai #{name} attacked with #{weapon.type.demodulize}"
    end
  end
end
