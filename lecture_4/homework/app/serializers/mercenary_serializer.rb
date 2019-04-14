# frozen_string_literal: true

class MercenarySerializer < ActiveModel::Serializer
  attributes :name, :preferred_weapon_kind, :experience, :price, :available_from, :warrior

  def warrior
    object.warrior.nil? ? nil : WarriorSerializer.new(object.warrior)
  end
end
