# frozen_string_literal: true

class MercenarySerializer < ActiveModel::Serializer
  attributes :name, :experience, :preferred_weapon_kind, :available_from,
             :warrior_id

  belongs_to :warrior
end
