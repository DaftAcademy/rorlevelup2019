# frozen_string_literal: true

class HussarRanger < Hussar
  has_one :ranged_weapon, dependent: :destroy, as: :ra_wpnable
  def attack
    "#{name}: *hussar ranged attack*"
  end
end
