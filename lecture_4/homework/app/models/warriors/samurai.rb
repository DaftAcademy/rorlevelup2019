# frozen_string_literal: true

module Warriors
  class Samurai < Warrior
    attribute :preferred_weapon_kind, :string, default: :melee

   
    def weapon_attack_mesage
      if weapon
        "attacked with #{weapon.type.demodulize}"
      else
        "has #{NullWeapon.new.type.demodulize}"
      end
    end
  end
end
