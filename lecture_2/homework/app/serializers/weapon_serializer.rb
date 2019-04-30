# frozen_string_literal: true

class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :damage, :range, :type #:wpnables?
end
