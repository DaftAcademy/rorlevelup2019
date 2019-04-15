class ClanSerializer < ApplicationSerializer
  attributes :name, :created_at, :updated_at

  has_many :warriors, links: {
    self: :url,
    related: -> (object) {
      "localhost:3000/clans/#{object.id}/warriors"
    }
  }
end
