class Samurai < Warrior
  validates :equipment_type, inclusion: {in: %w{Melee}, message: "=> Samurai can only use Melee weapon"}
  
  def attack
    "#{name} used katana"
  end
end
