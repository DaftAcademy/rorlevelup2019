# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name

  has_many :warriors
end
