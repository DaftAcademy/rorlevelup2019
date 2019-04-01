class Spell < Weapon
    def calculate_damage(distance)
        return 0 if distance < 4 || distance > range

        damage * (1000 / distance * range).to_f
    end
end
