class Hussar < Warrior
  validates :equipment_type, inclusion: {in: %w{Melee}, message: "=> Hussar can only use Melee weapon"}

  def attack
    "CHARGE!!"
  end
end
