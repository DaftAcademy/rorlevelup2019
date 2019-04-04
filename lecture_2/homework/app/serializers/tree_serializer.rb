# frozen_string_literal: true

class TreeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :warriors
end
