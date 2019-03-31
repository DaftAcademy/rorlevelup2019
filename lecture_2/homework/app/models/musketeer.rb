class Musketeer < Warrior
  has_one :weapon, class_name: "Ranged", foreign_key: "warrior_id", dependent: :nullify

  def attack
    "Raises his musket gently and shoots."
  end
end
