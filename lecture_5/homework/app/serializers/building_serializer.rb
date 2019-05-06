# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name, :type, :granary, :horse_units, :infantry_units, :warriors_alive, :siege_ability

  has_many :warriors

  def type
    object.type.demodulize
  end

  def warriors_alive
    object.warriors.select { |w| !w.death_date }.length
  end

   def siege_ability
     return Reports::SiegeReport.new(building: object).call if object
   end
end
