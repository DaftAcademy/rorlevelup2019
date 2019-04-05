# frozen_string_literal: true

class WarriorSerializer < ActiveModel::Serializer
  attributes :id, :name, :armor_quality, :number_of_battles,
             :join_date, :death_date, :type, :weapon_of_choice
  belongs_to :clan
  belongs_to :defensible
  has_one :weapon
end
