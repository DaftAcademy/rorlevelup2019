class ClanSerializer < ActiveModel::Serializer
  attributes :name

  has_many :warriors
end
