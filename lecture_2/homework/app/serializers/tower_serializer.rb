class TowerSerializer < ActiveModel::Serializer
  attributes :id,:name
  has_many :warriors
end
