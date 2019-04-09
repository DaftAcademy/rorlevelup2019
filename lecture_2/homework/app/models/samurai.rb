class Samurai < Warrior
  attribute :weapon_kind, :string, default: Weapon.kinds[:melee]

  def attack
    "#{name} used katana!"
  end
end
