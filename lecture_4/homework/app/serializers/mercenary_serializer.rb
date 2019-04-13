# frozen_string_literal: true

class MercenarySerializer < ActiveModel::Serializer
  attributes :name, :experience, :price, :preferred_weapon_kind
end
