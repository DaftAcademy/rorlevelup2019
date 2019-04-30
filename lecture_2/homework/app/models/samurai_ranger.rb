# frozen_string_literal: true

class SamuraiRanger < Samurai
  has_one :ranged_weapon, dependent: :destroy, as: :ra_wpnable
  def attack
    "#{name}: *samurai ranged attack*"
  end
end
