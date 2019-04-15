# frozen_string_literal: true

class ClanSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name
  has_many :warriors
end
