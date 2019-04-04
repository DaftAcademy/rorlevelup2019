class WeaponSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :range, :damage, :kind, :type
end
