class ClanSerializer
  include FastJsonapi::ObjectSerializer

  has_many :warriors
  set_id :id
  attributes :name
end
