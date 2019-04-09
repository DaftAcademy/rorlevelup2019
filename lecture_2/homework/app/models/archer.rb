class Archer < Warrior
  attr_accessor :weapon 

  def attack
    "#{name} use Bow"
  end

  validates :weapon, allow_nil: true
end
