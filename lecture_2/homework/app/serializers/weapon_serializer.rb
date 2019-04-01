class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :range, :damage, :type
end
