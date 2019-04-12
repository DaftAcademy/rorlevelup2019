# frozen_string_literal: true

# Add missing serializer
class MercenarySerializer < ActiveModel::Serializer
  attributes :name, :experience, :preferred_weapon_kind, :available_from, :price

  belongs_to :warrior
end
