# frozen_string_literal: true

class MercenarySerializer < ActiveModel::Serializer
  belongs_to :warrior

  attributes :name, :price, :experience, :available_from,
             :preferred_weapon_kind
end
