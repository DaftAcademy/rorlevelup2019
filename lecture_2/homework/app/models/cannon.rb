class Cannon < Weapon
    def calculate_damage(distance)
        return 0 if distance < 15 || distance > range

        1000 / distance
    end
end
