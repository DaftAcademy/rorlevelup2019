# frozen_string_literal: true

module Warriors
  class Hussar < Warrior
    attribute :preferred_weapon_kind, :string, default: :ranged

    def weapon_attack_message
      if weapon
        "charged while yielding #{weapon.type.demodulize}"
      else
        "has #{NullWeapon.new.type.demodulize}"
      end
    end
  end
end
