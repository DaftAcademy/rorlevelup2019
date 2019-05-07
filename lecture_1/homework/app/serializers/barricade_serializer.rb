class BarricadeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :defense
end
