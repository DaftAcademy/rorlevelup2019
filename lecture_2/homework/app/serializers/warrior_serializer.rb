class WarriorSerializer < ActiveModel::Serializer
  attributes :id, :name, :armor_quality, :number_of_battles, :join_date, :death_date, :defensible_type, :defensible_id
  has_one :weapon
  belongs_to :clan
end
