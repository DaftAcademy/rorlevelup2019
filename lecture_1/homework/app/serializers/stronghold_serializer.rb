class StrongholdSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :defense
end
