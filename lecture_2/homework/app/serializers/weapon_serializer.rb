class WeaponSerializer < ActiveModel::Serializer
  attributes :name, :damage, :range

  belongs_to :warrior
end
