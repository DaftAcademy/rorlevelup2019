# frozen_string_literal: true

module Factory
  class WarriorFactory
    def self.create(warrior_class:, clan:, building:, mercenary:)
      Warrior.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind,
                      mercenary: mercenary, type: warrior_class)
    end

    def self.create(mercenary:, clan:, building:)
      Warrior.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind,
                      mercenary: mercenary, type: mercenary.preferred_warrior_type)
    end
  end
  end
