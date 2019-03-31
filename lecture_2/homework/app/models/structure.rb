class Structure < ApplicationRecord
    has_many :warriors, dependent: :destroy
end
