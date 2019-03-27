class Melee < Weapon
    def calculate_damate
        damage = range < 2 ? 750 : 0
    end
end
