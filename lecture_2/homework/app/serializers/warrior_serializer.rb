# frozen_string_literal: true

class WarriorSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :armor_quality, :number_of_battles, :join_date, :death_date, :type, :weapon_kind
  belongs_to :clan
  belongs_to :defensible
  has_one :weapon
end
