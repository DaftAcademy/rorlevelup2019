class Hussar < Warrior
  attribute :weapon_kind, :string, default: Weapon.kinds[:melee]

  def attack
    "CHARGE!!!"
  end
end
