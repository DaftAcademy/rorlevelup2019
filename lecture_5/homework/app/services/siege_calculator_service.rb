class SiegeCalculatorService
  attr_reader :building_id

  def initialize(building)
    @building = building
    @warriors = building.warriors.alive
  end

  def call 
    @building.horse_units = horsey = @warriors.with_horse.count
    @building.infantry_units = infantry = @warriors.without_horse.count
    ability_to_whistand = @building.granary / ( 10 + horsey * 2 + infantry )
    @building.siege_ability = ability_to_whistand
  end
end
