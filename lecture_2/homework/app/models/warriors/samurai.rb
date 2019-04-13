# frozen_string_literal: true

module Warriors
  class Samurai < Warrior
    attr_accessor :weapon
    WEAPONS = %w[Katana Bow Tanto].freeze
    def attack
      "#{name} use #{WEAPONS.sample}"
    end

    validates :equipment, inclusion: { in: WEAPONS }, allow_nil: true
  end
end
