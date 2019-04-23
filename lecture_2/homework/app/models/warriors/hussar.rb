# frozen_string_literal: true

module Warriors
  class Hussar < Warrior
    validates :equipment, inclusion: { in: 'Bow' }, allow_nil: true
    def attack
      "#{name} use #{equipment}"
    end
    def weapons_of_choice
     %w[ lance sword ]
    end
  end
end
