class FortressSerializer < ActiveModel::Serializer
  attributes :id, :name, :fosse
  has_many :warriors
end
