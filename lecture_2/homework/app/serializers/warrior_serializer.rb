class WarriorSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_battles, :armor_quality, :type, :clan_id, :defensible_type

  belongs_to :clan
  has_one :weapon
end
