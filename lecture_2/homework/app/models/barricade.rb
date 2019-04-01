class Barricade < ApplicationRecord
  has_many :warriors, as: :defensible
end
