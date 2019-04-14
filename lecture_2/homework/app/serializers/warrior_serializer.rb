# frozen_string_literal: true

class WarriorSerializer < ActiveModel::Serializer
  attributes :id, :name, :armor_quality, :number_of_battles,
             :join_date, :death_date
  belongs_to :clan
  belongs_to :construction
  has_one :weapon
end
