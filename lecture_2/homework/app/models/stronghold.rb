class Stronghold < ApplicationRecord
  has_many :warriors, as: :defensible

  validates :name, presence: true
end
