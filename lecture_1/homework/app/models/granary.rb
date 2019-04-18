class Granary < ApplicationRecord
    belongs_to :building

    validates :food, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true }
end