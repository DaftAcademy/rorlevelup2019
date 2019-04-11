class Wall < ApplicationRecord
  has_many :warriors, as: :defensible
end
