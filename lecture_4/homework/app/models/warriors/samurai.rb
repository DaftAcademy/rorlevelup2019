# frozen_string_literal: true

module Warriors
  class Samurai < Warrior
    attribute :preferred_weapon_kind, :string, default: :melee
  end
end
