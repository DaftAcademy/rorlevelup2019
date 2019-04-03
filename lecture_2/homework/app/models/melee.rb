class Melee < Weapon
    def calculate_damage(distance)
        return 0 if distance > range
      
        damage * (1 - distance / range)
    end
end