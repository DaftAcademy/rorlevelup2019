class Husar < Warrior
  attribute :weapon_type, :string, default: :Magical

  def attack
    "#{name} did HDŻŻŻŻ"
  end
end
