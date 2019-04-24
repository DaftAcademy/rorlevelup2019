# frozen_string_literal: true

module Reports
  class SiegeReport
    attr_reader :building

    def initialize(building:)
      @building = building
    end

    def call
      @building.siege_ability = @building.warriors.alive.any? ? SiegeCalculatorService.new(@building).call : 0
    end
  end
end
