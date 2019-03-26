class Village < ApplicationRecord
  has_many :warriors, as: :defensible
end
