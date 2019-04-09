class BatteringRam < ApplicationRecord
  has_many :warriors, as: :defensible
end
