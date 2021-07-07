# frozen_string_literal: true

class Wizard < Warrior
  attr_accessor :weapon
  WEAPONS = %w[Fire_ball Avada_kedavra Thunder].freeze
  def attack
    "#{name} use #{WEAPONS.sample}"
  end

  validates :weapon, inclusion: { in: WEAPONS }, allow_nil: true
end
