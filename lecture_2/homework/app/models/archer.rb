# frozen_string_literal: true

class Archer < Warrior
  validates :weapon, inclusion: { in: 'Bow' }, allow_nil: true
  def attack
    "#{name} use Bow"
  end
end
