# frozen_string_literal: true

class WarriorCreator
  def initialize(warrior: nil)
    @warrior = warrior
  end

  def call_with_mercenary(warrior_class:, mercenary:, clan:, building:)
    create_warrior_with_mercenary(warrior_class: warrior_class, mercenary: mercenary, clan: clan, building: building)
  end

  def call(warrior_params:, clan:)
    create_warrior(warrior_params: warrior_params, clan: clan)
  end

  def update!(warrior_params:)
    @warrior.update!(warrior_params)
  end

  private

  def create_warrior(warrior_params:, clan:)
    clan.warriors.create!(warrior_params)
  end

  def create_warrior_with_mercenary(mercenary:, clan:, building:, warrior_class:)
    warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
  end
end
