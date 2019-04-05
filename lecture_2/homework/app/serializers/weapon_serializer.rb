class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :damage, :min_range, :max_range
end
