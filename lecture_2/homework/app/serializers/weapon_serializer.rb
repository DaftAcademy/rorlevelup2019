class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :damage, :range

  belongs_to :warrior
end
