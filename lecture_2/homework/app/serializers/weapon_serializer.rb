class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :damage, :range, :type
end
