class Hussar < Warrior
  attr_accessor :weapon 
  WEAPONS = %w( Sword Lance )
  def attack
    "#{name} use #{WEAPONS.sample}"
  end

  validates :weapon, inclusion: { in: WEAPONS }, allow_nil: true
end
