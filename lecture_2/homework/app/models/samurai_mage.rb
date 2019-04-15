# frozen_string_literal: true

class SamuraiMage < Samurai
  has_one :magical_weapon, dependent: :destroy, as: :ma_wpnable
  def attack
    "#{name}: *samurai magical attack*"
  end
end
