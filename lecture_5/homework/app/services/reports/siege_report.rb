# frozen_string_literal: true

module Reports
  class SiegeReport
    def initialize(building:)
      @building = building
    end

    def call
      no_army? ? no_siege_ability : create_siege_report
    end

    private

    def no_army?
      @building.warriors.empty?
    end

    def no_siege_ability
      @building.siege_ability = 0
    end

    def create_siege_report
      @building.siege_ability
    end
  end
end
