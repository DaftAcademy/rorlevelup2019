class Archer < Warrior
  validates :equipment_type, inclusion: {in: %w{Ranged}, message: "=> Archer can only use Ranged weapon"} 

  def attack
    "#{name} shot bow & arrow"
  end
end
