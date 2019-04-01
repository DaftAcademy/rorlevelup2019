class Barricade < ApplicationRecord
  has_many :warriors, as: :defensible

  validates :name, presence: true
  validates :amount_of_wood, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
