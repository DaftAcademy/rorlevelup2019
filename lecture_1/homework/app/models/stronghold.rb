class Stronghold < ApplicationRecord
    has_many :warriors, as: :defensible
    validates :name, presence: true, length: { maximum: 256 }
    validates_uniqueness_of :name
    validates :defense, presence: true, numericality: { greater_than: 10000, less_than: 100000, only_integer: true }
end