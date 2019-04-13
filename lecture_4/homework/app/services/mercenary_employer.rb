# frozen_string_literal: true

class MercenaryEmployer
  def initialize(params, mercenary)
    @params = params
    @mercenary = mercenary
  end

  def call
    clan = ClanFinder.new(@params[:clan_id]).call
    building = BuildingFinder.new(@params[:building_id]).call
    warrior_class = WarriorClassFinder.new(@params[:warrior_class], clan).call
    warrior = WarriorCreator.new(@mercenary, clan, building, warrior_class).call
    WeaponCreator.new(@mercenary).call
    warrior
  end
end
