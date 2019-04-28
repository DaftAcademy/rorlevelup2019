# frozen_string_literal: true

class BuildingsQueries
  def self.buildings(relation:)
    relation.includes(:warriors).all
  end

  def self.building(relation:, id:)
    relation.find(id)
  end

  def self.count_warriors_of_specified_type(relation:, building:, type:)
    relation.find(building.id).warriors.where(type: type).count
  end
end
