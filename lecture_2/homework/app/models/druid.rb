class Druid < Warrior
  validates :equipment_type, inclusion: {in: %w{Magical}, message: "=> Druid can only use Magical weapon"}
  
  def attack
    "#{name} said the spells"
  end
end

