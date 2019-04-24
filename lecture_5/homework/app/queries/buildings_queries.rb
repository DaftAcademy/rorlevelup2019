# frozen_string_literal: true

class BuildingsQueries
  def self.buildings(relation:)
    relation.includes(:warriors).all
  end

  def self.building(relation:, id:)
    relation.find(id)
  end
end
