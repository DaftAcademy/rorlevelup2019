class Tree < ApplicationRecord
    has_many :warriors, as: :defensible
end
