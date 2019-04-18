# frozen_string_literal: true

class WarriorsQueries
  def self.destroy_warrior(warrior:)
    warrior.destroy!
  end

  def self.all_clans_warriors(clan:)
    clan.warriors.all
  end

  def self.find_warrior(clan:, warrior_id:)
    clan.warriors.find(warrior_id)
  end

  def self.create_warrior(clan:, warrior_params:)
    clan.warriors.create!(warrior_params)
  end

  def self.update_warrior(warrior:, warrior_params:)
    warrior.update!(warrior_params)
  end

  def self.choose_class(clan:)
    clan.warriors
        .select('type, count(type) as warriors_count')
        .group(:type)
        .order('warriors_count ASC')
        .first
        .class
  end

  def self.create_mercenary_warrior(warrior_class:, mercenary:, clan:, building:)
    warrior_class.create!(
      name: mercenary.name,
      clan: clan,
      building: building,
      preferred_weapon_kind: mercenary.preferred_weapon_kind,
      mercenary: mercenary
    )
  end
end
