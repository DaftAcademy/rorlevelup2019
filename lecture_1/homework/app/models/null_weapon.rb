class NullWeapon

    def id
        return nil
    end

    def warrior
        return NullWarrior.new
    end

    def range
        return 0
    end

    def damage
        return 0
    end

end