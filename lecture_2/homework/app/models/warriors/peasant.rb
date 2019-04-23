# frozen_string_literal: true

module Warriors
  class Peasant < Warrior
    validates :equipment, inclusion: { in: 'Bow' }, allow_nil: true
    def attack
      "#{name} use #{equipment}"
    end
    def weapons_of_choice
      %w[ stick_with_shit]
    end
  end
end
