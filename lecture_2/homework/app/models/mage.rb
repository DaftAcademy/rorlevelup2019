class Mage < Character
  validates :weapon, inclusion: { in: "magical_weapon"}, allow_nil: true
  def attack
    "#{name}: Pew pew pew! Whizzzz! <put some magic noises here>"
  end
end
