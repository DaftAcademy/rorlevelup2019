# frozen_string_literal: true

class ClanSerializer < ActiveModel::Serializer
  has_many :warriors

  attributes :name
end
