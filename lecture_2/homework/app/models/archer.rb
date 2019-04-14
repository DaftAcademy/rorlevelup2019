# frozen_string_literal: true

class Archer < Warrior
  attribute :weapon_kind, :string, default: Weapon.kinds[:ranged]

  def attack
    "#{name} shot a bow!"
  end
end
