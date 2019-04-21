# frozen_string_literal: true

module Reports
  class SiegeReport
    def initialize(building:)
      @building = building
    end

    def call
      calc_siege_ability
    end

    private

    attr_reader :building

    def calc_siege_ability
      return 0 if @building.warriors.count.zero?

      day_req = 10
      @building.warriors.each do |warrior|
        day_req += if warrior.type == 'Warriors::Hussar'
                     2
                   else
                     1
                   end
      end
      @building.granary / day_req
    end
  end
end
