# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name, :type, :granary, :siege_ability

  has_many :warriors
end
