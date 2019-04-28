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

  def self.update_siege_ability(relation:, building:, result:)
    relation.find(building.id).update(siege_ability: result)
  end
end
