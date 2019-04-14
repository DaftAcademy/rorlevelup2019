# frozen_string_literal: true

class Witcher < Warrior
  attribute :weapon_kind, :string, default: Weapon.kinds[:melee]

  def attack
    'Graj, muzyko!'
  end
end
