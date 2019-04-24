# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name, :type, :granary, :horse_units, :infantry_units, :warriors_alive, :siege_ability

  has_many :warriors

  def type
    object.type.split('::')[1]
  end

  def warriors_alive
    object.warriors.alive.count
  end
end
