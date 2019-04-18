# frozen_string_literal: true

class BuildingsQueries
  def self.find_building(id:, relation: Building)
    relation.find(id) if id
  end
end
