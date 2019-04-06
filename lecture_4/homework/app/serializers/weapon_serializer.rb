# frozen_string_literal: true

class WeaponSerializer < ActiveModel::Serializer
  attributes :range, :damage, :kind

  belongs_to :warrior
end
