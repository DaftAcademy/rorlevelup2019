class DefensibleSerializer
  include FastJsonapi::ObjectSerializer

  has_many :warriors
end
