# frozen_string_literal: true

class BuildingsQuery
  def self.find_by_id(id = nil, relation: Building)
    id.nil? ? relation.first : relation.find(id)
  end
end
