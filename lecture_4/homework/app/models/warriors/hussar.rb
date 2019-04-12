# frozen_string_literal: true

module Warriors
  class Hussar < Warrior
    attribute :preferred_weapon_kind, :string, default: :ranged

    def attack
      "Hussar #{name} attacked with #{weapon_check.type.demodulize}"
    end

    private

    def weapon_check
      weapon || NullObjects::NullWeapon.new
    end
  end
end
