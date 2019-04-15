class WallSerializer < ActiveModel::Serializer
  attributes :id, :name, :height, :thickness, :strength
  has_many :warriors
end
