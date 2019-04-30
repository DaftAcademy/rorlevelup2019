# frozen_string_literal: true

class HussarMage < Hussar
  has_one :magical_weapon, dependent: :destroy, as: :ma_wpnable
  def attack
    "#{name}: *hussar magical attack*"
  end
end
