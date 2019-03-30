class Gate < ApplicationRecord
  has_many :warriors, as: :defensible
end
