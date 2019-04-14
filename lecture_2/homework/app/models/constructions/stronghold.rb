module Constructions
  class Stronghold < ApplicationRecord
    has_many :warriors, as: :defensible
  end
end
