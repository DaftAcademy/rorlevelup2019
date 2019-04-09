class Hussar < Warrior
  has_one :weapon, class_name: "Magical", foreign_key: 'warrior_id', dependent: :nullify

  def attack
    "CHARGE!!"
  end
end
