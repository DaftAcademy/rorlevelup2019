class SamuraiWarrior < Samurai
  has_one :melee_weapon, dependent: :destroy, as: :me_wpnable
  def attack
	"#{name}: *samurai melee attack*"
  end
end
