class BuildingSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :granary
end