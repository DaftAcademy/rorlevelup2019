# frozen_string_literal: true

module Reports
  class SiegeReport
    def initialize(building:)
      @building = building
    end

    def call
      no_army? ? no_siege_ability : compute_siege_ability
    end

    private

    def no_army?
      @building.warriors.empty?
    end

    def no_siege_ability
      save_siege_report_result(0)
      @building.siege_ability = 0
    end

    def compute_siege_ability
      daily_food_demand = compute_daily_food_demand
      result = siege_ability(daily_food_demand)
      save_siege_report_result(result)
    end

    def compute_daily_food_demand
      stronghold_staff + hussars + samurais
    end

    def stronghold_staff
      10
    end

    def hussars
      BuildingsQueries.count_warriors_of_specified_type(
        relation: Building,
        building: @building,
        type: 'Warriors::Hussar'
      ) * 2
    end

    def samurais
      BuildingsQueries.count_warriors_of_specified_type(
        relation: Building,
        building: @building,
        type: 'Warriors::Samurai'
      )
    end

    def siege_ability(daily_food_demand)
      granary / daily_food_demand
    end

    def granary
      @building.granary
    end

    def save_siege_report_result(result)
      BuildingsQueries.update_siege_ability(
        relation: Building,
        building: @building,
        result: result
      )
      @building.siege_ability = result
    end
  end
end
