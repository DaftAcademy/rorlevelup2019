# frozen_string_literal: true

class SiegeCalculatorService
  attr_reader :building, :warriors

  def initialize(building, warriors)
    @building = building
    @warriors = warriors
  end

  def call
    building.horse_units = horsey = warriors.with_horse.count
    building.infantry_units = infantry = warriors.without_horse.count
    building.granary / (10 + horsey * 2 + infantry)
  end
end
