class Bunker < ApplicationRecord
  has_many :warriors, as: :defensible
end
