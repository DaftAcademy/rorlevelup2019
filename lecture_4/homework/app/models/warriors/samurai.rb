# frozen_string_literal: true

module Warriors
  class Samurai < Warrior
    attribute :preferred_weapon_kind, :string, default: :melee

    def attack
      "Samurai #{name} attacked with #{(weapon || NullWeapon.new).type.demodulize}"
    end
  end
end
