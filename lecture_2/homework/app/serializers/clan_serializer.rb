# frozen_string_literal: true

class ClanSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :warriors
end
