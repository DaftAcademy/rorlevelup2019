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
      daily_food_demand = compute_daily_food_demand
      result = compute_siege_ability(daily_food_demand)
      save_siege_report_result(result)
    end

    def compute_daily_food_demand
      stronghold_staff + hussars + samurais
    end

    def stronghold_staff
      10
    end

    def hussars
      BuildingsQueries.hussars(relation: Building, building: @building) * 2
    end

    def samurais
      BuildingsQueries.samurais(relation: Building, building: @building)
    end

    def compute_siege_ability(daily_food_demand)
      granary / daily_food_demand
    end

    def granary
      @building.granary
    end

    def save_siege_report_result(result)
      @building.siege_ability = result
    end
  end
end
