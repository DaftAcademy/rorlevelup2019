class Bow < Weapon
    def calculate_damage(distance)
        return 0 if distance < 4 || range > 50

        damage * (range / distance)
    end
end
