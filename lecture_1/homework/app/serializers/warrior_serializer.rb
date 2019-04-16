class WarriorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :armor, :battles, :join_date, :death_date, :type, :weapon
end
