class ClanSerializer
  include FastJsonapi::ObjectSerializer
  
  set_type :clan
  set_id :id
  attributes :name, :created_at, :updated_at
  has_many :warriors
end
