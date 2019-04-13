# frozen_string_literal: true

module Warriors
  class Wizard < Warrior
    attr_accessor :weapon
    WEAPONS = %w[Fire_ball Avada_kedavra Thunder].freeze
    EFFECT = ['and kills', 'and miss'].freeze
    def attack
      "#{name} use #{WEAPONS.sample}, #{EFFECT.sample}"
    end

    validates :equipment, inclusion: { in: WEAPONS }, allow_nil: true
  end
end
