# frozen_string_literal: true

module Reports
  class SiegeReport
    def initialize(building:)
      @building = building
    end

    def call
      return 0 if @building.warriors.all.empty?

      consume_rate = 10
      @building.warriors.each do |warrior|
        consume_rate += if warrior.type == 'Warriors::Hussar'
                          2
                        else
                          1
                        end
      end
      @building.granary / consume_rate
    end
  end
end
