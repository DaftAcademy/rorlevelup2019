class Ranged < Weapon
    attribute :range, default: 30
    
    def calculate_damage(distance)
        return 0 if distance > range
        damage * (0.06*distance + 0.036 * (distance**2) - 0.004 * (distance**3) + 0.00013 * (distance**4))
    end
end