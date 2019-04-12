# frozen_string_literal: true

module QueryObjects
  class BuildingQuery
    def self.find_by_id(id = nil, relation: Building)
      if id.nil?
        relation.first
      else
        relation.find(id)
      end
    end
  end
end
