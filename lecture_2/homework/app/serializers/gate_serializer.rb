class GateSerializer < ActiveModel::Serializer
  attributes :id, :name, :material, :thickness, :strength
  has_many :warriors
end
