# frozen_string_literal: true

module Reports
  class SiegeReport
    def initialize(building:)
      @building = building
    end

    def call
      daily_supplies = 10
      if @building.warriors.alive.any?
        @building.warriors.alive.each do |warrior|
          daily_supplies += if warrior.type == 'Warriors::Hussar'
                              2
                            else
                              1
                            end
        end
      else
        return @building.siege_ability = 0
        end
      @building.siege_ability = (@building.granary / daily_supplies).floor
    end
  end
end
