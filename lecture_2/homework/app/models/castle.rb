class Castle < ApplicationRecord
  has_many :warriors, as: :defensible
end
