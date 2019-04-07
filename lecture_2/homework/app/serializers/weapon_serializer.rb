class WeaponSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  belongs_to :warrior
end
