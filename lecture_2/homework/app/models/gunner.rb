class Gunner < Warrior
  attribute :weapon_kind, :string, default: Weapon.kinds[:ranged]

  def attack
    "BOOOM!!!"
  end
end
