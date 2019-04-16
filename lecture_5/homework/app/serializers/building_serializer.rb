# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name, :siege_ability, :granary, :warriors_count

  has_many :warriors

  def siege_ability
    Reports::SiegeReport.new(building: self.object).call
  end

  def warriors_count
    self.object.warriors.count
  end
end
