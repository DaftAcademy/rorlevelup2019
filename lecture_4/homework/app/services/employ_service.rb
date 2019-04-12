# frozen_string_literal: true

# Service Object - common part for employ_best & employ (DRY)
class EmployService
  def initialize(params, mercenary)
    @params = params
    @mercenary = mercenary
  end

  def run
    clan = FindClansService.new(@params).run
    building = FindBuildingService.new(@params).run
    warrior_class = WarriorClassService.new(clan).run
    WarriorCreateService.new(@mercenary, clan, building, warrior_class).run
  end
end
