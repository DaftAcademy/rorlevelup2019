class NullBuilding

    def id
        return nil
    end
    
    def warriors
        return []
    end

    def granary
        return NullGranary.new
    end

    def name
        return ""
    end

end