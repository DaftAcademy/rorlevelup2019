# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name, :granary, :siege_ability

  has_many :warriors

  def siege_ability
    Reports::SiegeReport.new(building: object).call
  end
end
