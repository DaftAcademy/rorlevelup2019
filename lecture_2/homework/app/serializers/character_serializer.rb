class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :armor_quality, :number_of_battles, :join_date, :death_date, :type
  belongs_to :clan 
  belongs_to :defensible
end