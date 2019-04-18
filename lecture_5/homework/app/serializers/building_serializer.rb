# frozen_string_literal: true

class BuildingSerializer < ActiveModel::Serializer
  attributes :name, :siege_ability, :granary

  has_many :warriors
end
