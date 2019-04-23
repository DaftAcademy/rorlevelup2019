class WarriorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :clan_id, :death_date, :armor_quality, :number_of_battles,
             :join_date, :kind, :attack, :equipment, :defensible_type
  belongs_to :clan
  belongs_to :defensible, polymorphic: true
  has_one :weapon
end
