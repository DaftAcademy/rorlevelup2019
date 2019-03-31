class Ranged < Weapon
    
    def calculate_damage(distance)
        return 0 if distance < 2
        return damage/2 if distance > range
        damage
    end

end
  