class WarriorSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :death_date, :armor_quality, :number_of_battles, :join_date, :type
  belongs_to :weapon
  belongs_to :structure
  belongs_to :clan
end
