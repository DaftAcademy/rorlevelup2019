class Weapon < ApplicationRecord
    belongs_to :warrior

    validates :range, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true }
    validates :type, presence: true
end