# frozen_string_literal: true

module Reports
  class SiegeReport
    def initialize(building:)
      @warriors = building.warriors
      @granary = building.granary
    end

    def call
      @warriors.present? ? @granary / daily_consumption : 0
    end

    private

    def daily_consumption
      sum = 10
      @warriors.map do |warrior|
        if warrior.type == 'Warriors::Samurai'
          sum += 1
        elsif warrior.type == 'Warriors::Hussar'
          sum += 2
        end
      end
      sum
    end
  end
end
