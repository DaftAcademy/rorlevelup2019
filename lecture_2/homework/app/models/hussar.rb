# frozen_string_literal: true

class Hussar < Warrior
  attribute :weapon_kind, :string, default: Weapon.kinds[:melee]

  def attack
    'CHARGE!!!'
  end
end
