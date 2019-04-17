# frozen_string_literal: true

module Reports
  class SiegeReport
    def initialize(building:)
      @building = building
      @warriors = building.warriors
    end

    def call
      @building.siege_ability = (@warriors.present? ? @building.granary / food_demand : 0)
      @building.save
      @building.siege_ability
    end

    private

    def food_demand
      daily_basic = 10
      samurais = @warriors.where(type: 'Warriors::Samurai').count
      hussars = @warriors.where(type: 'Warriors::Hussar').count * 2
      daily_basic + samurais + hussars
    end
  end
end
