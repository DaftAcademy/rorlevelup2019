# frozen_string_literal: true

module Reports
  class SiegeReport
    attr_reader :building, :warriors

    def initialize(building:)
      @building = building
      @warriors = building.warriors.alive
    end

    def call
      warriors.any? ? SiegeCalculatorService.new(building, warriors).call : 0
    end
  end
end
