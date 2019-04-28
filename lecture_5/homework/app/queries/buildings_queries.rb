# frozen_string_literal: true

class BuildingsQueries
  def self.buildings(relation:)
    relation.includes(:warriors).all
  end

  def self.building(relation:, id:)
    relation.find(id)
  end

  def self.hussars(relation:, building:)
    relation.find(building.id).warriors.where(type: 'Warriors::Hussar').count
  end

  def self.samurais(relation:, building:)
    relation.find(building.id).warriors.where(type: 'Warriors::Samurai').count
  end
end
