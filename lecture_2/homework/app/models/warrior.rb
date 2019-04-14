class Warrior < Character
  validates :weapon, inclusion: { in: "melee_weapon"}, allow_nil: true
  def attack
    "#{name}: *melee noises*"
  end
end
