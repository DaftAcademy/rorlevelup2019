class ClanSerializer < ApplicationSerializer

  # The type parameters is optional in the docs, but I'm thinking how should it be implemented with an uppercase letter in front like a model? 
  set_type :Clan
  attributes :name, :created_at, :updated_at

  # has_many :warriors
  has_many :warriors, links: {
    self: :url,
    related: -> (object) {
      "localhost:3000/clans/#{object.id}/warriors"
    }
  }
  
end
