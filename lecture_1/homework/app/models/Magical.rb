class Magical < Weapon
    def initialize
        self.ranged = 100
    end
    def calculate_damage(distance)
        return 0 if distance > range
        damage * (1 - distance / range) * Random(10)/10
    end
end