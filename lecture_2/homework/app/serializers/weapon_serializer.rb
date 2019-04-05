class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :damage, :range
end
