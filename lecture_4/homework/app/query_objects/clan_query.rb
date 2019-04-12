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
  end
end
