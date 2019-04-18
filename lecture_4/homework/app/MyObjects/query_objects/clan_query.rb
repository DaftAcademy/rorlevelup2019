# frozen_string_literal: true

module QueryObjects
  class ClanQuery
    def self.find_by_id(id = nil, relation: Clan)
      if id.nil?
        relation.order(warriors_count: :desc).first
      else
        relation.find(id)
      end
    end

    def self.find_popular_class(clan = Clan.first, relation: Clan)
      clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
    end
  end
end
