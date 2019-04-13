# frozen_string_literal: true

class MercenaryToWarrior
  def initialize(mercenary: nil)
    @mercenary = mercenary || MercenariesQuery.the_best || NullMercenary.new
  end

  def call(clan:, building:)
    create_warrior(clan: clan, building: building)
  end

  private

  def create_warrior(clan:, building:)
    warrior_class = @mercenary.choose_class(clan: clan)
    warrior = WarriorCreator.new.call_with_mercenary(warrior_class: warrior_class, mercenary: @mercenary, clan: clan, building: building)
    create_good_weapon
    warrior
  end

  def create_good_weapon
    case @mercenary.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: @mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: @mercenary.warrior, range: 40, damage: 10)
    end
  end
end
