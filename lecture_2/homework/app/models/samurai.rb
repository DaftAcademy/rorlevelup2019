# frozen_string_literal: true

class Samurai < Warrior
  attr_accessor :weapon
  WEAPONS = %w[Katana Bow Tanto].freeze
  def attack
    "#{name} use #{WEAPONS.sample}"
  end

  validates :weapon, inclusion: { in: WEAPONS }, allow_nil: true
end
