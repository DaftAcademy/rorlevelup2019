# frozen_string_literal: true

module Reports
  class SiegeReport

    attr_reader :building

    def initialize(building:)
      @building = building
    end

    def call
      return 0 unless no_soliders?

      ## Food unit counting based on table below:
      ## ========================================
      # Warriors use 1 food units per day
      # Cavalery uses 2 food units per day | do I have any of this type? TODO: add suport if it's not about the type but ratehr new class
      # Civilians uses 10 food units per day

      days = 0
      granary = @building.granary

      while granary >= 0
        days += 1
        granary -= ( 10 + @building.warriors.count )
      end

      return days

    end

    private

    # def error_response(message: 'error bad request', status: :unprocessable_entity)
    #
    # end

    def no_soliders?
      building.warriors.count > 0
    end

  end
end
