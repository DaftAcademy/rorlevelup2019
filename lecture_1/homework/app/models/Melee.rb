class Melee < Weapon
    def initialize
        self.ranged = 2
    end
    def calculate_damage(distance)
        return 0 if distance > range
        damage * (1 - distance / range)
    end
end