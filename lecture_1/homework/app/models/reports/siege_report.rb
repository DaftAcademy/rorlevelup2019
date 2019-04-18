module Reports
    class SiegeReport
        def initialize(building)
            @building = building
            @samurais = (building.warriors.where(type: 'Samurai') || 0)
            @hussars = (building.warriors.where(type: 'Hussar') || 0)
        end
        def food_required
            @food ||= 10 + @samurais.count + (@hussars.count*2)
        end

        def siege_days
            @siege_days ||= @samurais.count + (@hussars.count*2)
        end
    end
end