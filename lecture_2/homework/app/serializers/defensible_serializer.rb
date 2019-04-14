class DefensibleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  has_many :warriors, polymorfic: true
end
