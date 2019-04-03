class Weapon < ApplicationRecord
    belongs_to :warrior

    validates :range, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true }
    validates :damage, presence: true, numericality: {greater_than: 0, less_than: 100, only_integer: true }
    validates :type, presence: true

    def calculate_damage(distance)
        return 0
    end
end