# frozen_string_literal: true

class HussarWarrior < Hussar
  has_one :melee_weapon, dependent: :destroy, as: :me_wpnable
  def attack
    "#{name}: *hussar melee attack*"
  end
end
