# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name, :type, :granary

  has_many :warriors
end
