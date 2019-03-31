class WarriorSerializer < ActiveModel::Serializer
  attributes :id,:type,:name,:death_date,:join_date
  belongs_to :clan
  belongs_to :defensible
  has_one :weapon
end
