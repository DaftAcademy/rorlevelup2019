class Barricade < ApplicationRecord
    include Defensible
    has_many :warriors, as: :defensible
    validates :name, presence: true, length: { maximum: 256 }
    validates_uniqueness_of :name
    validates :defense, presence: true, numericality: { greater_than: 1000, less_than: 10000, only_integer: true }
end