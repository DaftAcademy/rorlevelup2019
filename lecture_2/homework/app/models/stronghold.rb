class Stronghold < ApplicationRecord
  has_many :warriors, as: :defensible
end
