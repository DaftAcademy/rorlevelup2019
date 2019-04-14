# frozen_string_literal: true

class WeaponSerializer < ActiveModel::Serializer
  attributes :type, :name, :damage, :range
end
