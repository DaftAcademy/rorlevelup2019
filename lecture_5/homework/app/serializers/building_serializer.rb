# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name, :siege_ability

  has_many :warriors
end
