# frozen_string_literal: true

class NullWarrior

    def id
        return nil
    end

    def clan
        return NullClan.new
    end

    def building
        return NullBuilding.new
    end

    def weapon
        return NullWeapon.new
    end

    def name
        return ""
    end

    def armor
        return 0
    end

    def battles
        return 0
    end

    def join_date
        return nil
    end

    def death_date
        return nil
    end

    def type
        return ""
    end

    def Alive
        return false
    end
end