# frozen_string_literal: true

class DefensibleSerializer
  include FastJsonapi::ObjectSerializer

  has_many :warriors
end