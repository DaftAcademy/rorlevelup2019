# frozen_string_literal: true

class MercenarySerializer < ActiveModel::Serializer
  attributes :name, :experience, :available_from, :price, :preferred_weapon_kind
  belongs_to :warrior
end
