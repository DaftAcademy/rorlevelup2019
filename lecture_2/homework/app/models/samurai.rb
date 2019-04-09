class Samurai < Warrior
  has_one :weapon, class_name: "Melee", foreign_key: 'warrior_id', dependent: :nullify

  def attack
    "#{name} used katana"
  end
end
