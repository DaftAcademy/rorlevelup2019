# frozen_string_literal: true

module Warriors
  class Peasant < Warrior
    attr_accessor :weapon
    WEAPONS = %w[Fork Scythe Stick_with_shit].freeze
    def attack
      "#{name} use #{WEAPONS.sample}"
    end

    validates :equipment, inclusion: { in: WEAPONS }, allow_nil: true
  end
end
