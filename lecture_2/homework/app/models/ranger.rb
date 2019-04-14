class Ranger < Character
  validates :weapon, inclusion: { in: "ranged_weapon"}, allow_nil: true
  def attack
    "#{name}: Ftong! Swoosh! *arrow hit noise*"
  end
end
