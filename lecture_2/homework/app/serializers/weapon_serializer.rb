class WeaponSerializer
  include FastJsonapi::ObjectSerializer
  attributes :damage, :range, :species 
end
