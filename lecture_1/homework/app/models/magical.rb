class Magical < Weapon
    attribute :range, default: 100
    
    def calculate_damage(distance)
        return 0 if distance > range
        damage * (1 - distance / range) * Random(10)/10
    end
end