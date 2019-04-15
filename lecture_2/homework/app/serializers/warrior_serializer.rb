class WarriorSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :number_of_battles, :armor_quality, :defensible_type, :death_date, :join_date
  belongs_to :clan
  belongs_to :defensible
  has_one :weapon
end
