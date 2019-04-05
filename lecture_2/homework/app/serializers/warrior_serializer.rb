class WarriorSerializer < ActiveModel::Serializer
  attributes :name, :armor_quality, :number_of_battles,
             :join_date, :death_date

  belongs_to :clan
  belongs_to :construction
  has_one :weapon
end
