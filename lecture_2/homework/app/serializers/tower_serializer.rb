class TowerSerializer < ActiveModel::Serializer
  attributes :id, :name, :height, :strength
  has_many :warriors
end
