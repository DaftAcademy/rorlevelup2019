# frozen_string_literal: true

class StrongholdSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :warriors
end
