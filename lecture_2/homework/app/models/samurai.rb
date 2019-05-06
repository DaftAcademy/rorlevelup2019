class Samurai < Warrior
  attribute :weapon_type, :string, default: :Melee

  def attack
    "#{name} did rach ciach"
  end
end
