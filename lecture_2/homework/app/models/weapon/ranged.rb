class Ranged < Weapon
    return 0 if distance > range
    damage**2 * (range - distance)
end
