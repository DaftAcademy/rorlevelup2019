# frozen_string_literal: true

class BuildingsQueries
  def self.buildings(relation:)
    relation.includes(:warriors).all
  end
end
