class Tower < ApplicationRecord
    has_many :warriors, as: :defensible
end
