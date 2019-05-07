class Melee < Weapon
    attribute :range, default: 2
    
    def calculate_damage(distance)
        return 0 if distance > range
        damage * (1 - distance / range)
    end
end