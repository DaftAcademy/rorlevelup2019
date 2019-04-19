class Turret < ApplicationRecord
  has_many :warriors, as: :defensible
end