# frozen_string_literal: true

module Warriors
  class Hussar < Warrior
    attr_accessor :weapon
    WEAPONS = %w[Sword Lance].freeze
    def attack
      "#{name} use #{WEAPONS.sample}"
    end

    validates :equipment, inclusion: { in: WEAPONS }, allow_nil: true
  end
end
