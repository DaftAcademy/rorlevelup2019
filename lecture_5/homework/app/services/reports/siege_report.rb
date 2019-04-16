# frozen_string_literal: true

module Reports
  class SiegeReport
    def initialize(building:)
      @building = building
      @warriors = building.warriors
    end

    def call
      siege = @warriors.present? ? @building.siege_ability = granary_ability : @building.siege_ability = 0
      @building.save
      siege
    end

    private

    def granary_request
      daily_request = 10
      samurais = @warriors.where(type: 'Warriors::Samurai').count
      hussars = @warriors.where(type: 'Warriors::Hussar').count * 2
      daily_request + samurais + hussars
    end

    def granary_ability
      granary = @building.granary
      granary / granary_request
    end
  end
end
