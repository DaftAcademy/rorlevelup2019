class WarriorSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :armor_quality,
             :number_of_battles, :death_date, :join_date
  belongs_to :clan
  belongs_to :defensible
  has_one :weapon
end
