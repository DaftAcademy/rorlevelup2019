# frozen_string_literal: true

class MercenarySerializer < ActiveModel::Serializer
  attributes :name, :experience, :price

  has_one :warrior, class_name: 'warrior', foreign_key: 'warrior_id'
end
