class WarriorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :armor_quality, :number_of_battles
  has_one :weapon
end
