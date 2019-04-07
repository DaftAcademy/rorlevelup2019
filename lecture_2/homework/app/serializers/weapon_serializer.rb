class WeaponSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :type
  belongs_to :warrior
end
