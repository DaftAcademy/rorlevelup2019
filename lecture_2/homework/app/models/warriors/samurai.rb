# frozen_string_literal: true

module Warriors
  class Samurai < Warrior
    validates :equipment, inclusion: { in: 'Bow' }, allow_nil: true
    def attack
      "#{name} use #{equipment}"
    end
    def weapons_of_choice
      %w[ katana bow]
    end
  end
end
