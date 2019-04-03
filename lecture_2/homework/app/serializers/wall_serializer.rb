# frozen_string_literal: true

class WallSerializer < ActiveModel::Serializer
  attributes :id, :name, :thickness
end
