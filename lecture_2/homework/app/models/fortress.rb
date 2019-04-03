class Fortress < ApplicationRecord
  has_many :warriors, as: :defensible
end