class WeaponSerializer < ActiveModel::Serializer
  attributes :id,:name,:range,:damage
  belongs_to :warrior
end
