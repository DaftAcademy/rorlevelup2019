# frozen_string_literal: true

module Warriors
  class Archer < Warrior
    validates :equipment, inclusion: { in: 'Bow' }, allow_nil: true
    def attack
      "#{name} use Bow"
    end
  end
end
