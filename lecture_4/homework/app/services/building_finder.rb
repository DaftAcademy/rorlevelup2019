# frozen_string_literal: true

class BuildingFinder
  def initialize(params:)
    @params = params
  end

  def call
    find_building
  end

  private

  attr_reader :params

  def find_building
    BuildingsQueries.find_building(id: params)
  end
end
