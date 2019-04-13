class Weapon < ApplicationRecord
    belongs_to :warrior
    
    validates :damage, :range, presence: true, numericality: { only_integer: true,
        greater_than_or_equal_to: 0,
        less_than_or_equal_to: 100 }
  
    def calculate_damage(distance)
        0
    end
end
