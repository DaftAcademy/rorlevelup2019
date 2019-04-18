# frozen_string_literal: true

class WarriorCreator
  def initialize(mercenary, clan, building, warrior_class)
    @mercenary = mercenary
    @clan = clan
    @building = building
    @warrior_class = warrior_class
  end

  def call
    create_warrior
  end

  private

  attr_reader :mercenary, :clan, :building, :warrior_class

  def create_warrior
    @warrior_class.create!(name: @mercenary.name,
                           clan: @clan,
                           building: @building,
                           preferred_weapon_kind: @mercenary.preferred_weapon_kind,
                           mercenary: @mercenary,
                           join_date: Time.now)
  end
end
