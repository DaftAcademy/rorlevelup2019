class Trench < ApplicationRecord
  has_many :warriors, as: :defensible
end
