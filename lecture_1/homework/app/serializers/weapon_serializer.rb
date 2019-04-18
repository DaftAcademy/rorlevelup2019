class WeaponSerializer
  include FastJsonapi::ObjectSerializer
  attributes :range, :damage, :type
end
