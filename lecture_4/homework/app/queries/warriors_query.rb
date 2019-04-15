# frozen_string_literal: true

class WarriorsQuery
  def self.find_by_id(id = nil, relation: Warrior)
    id.nil? ? relation.first : relation.find(id)
  end

  def self.belonging_to_clan(clan_id:, relation: Warrior)
    relation.where(clan_id: clan_id)
  end

  def self.get_class(relation: Warrior)
    relation.warriors.select('type, count(type) as warriors_count')
            .group(:type).order('warriors_count ASC').first.class
  end
end
