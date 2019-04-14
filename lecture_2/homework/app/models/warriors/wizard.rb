# frozen_string_literal: true

module Warriors
  class Wizard < Warrior
    EFFECTS = %w[kills misses].freeze
    def attack
      "#{name} use #{equipment}, and #{EFFECTS.sample}"
    end
    def weapons_of_choice
      ["wand"]
    end

    validates :equipment, inclusion: { in: WEAPONS }, allow_nil: true
  end
end
