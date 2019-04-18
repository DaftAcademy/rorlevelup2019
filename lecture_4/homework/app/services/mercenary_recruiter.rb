# frozen_string_literal: true

class MercenaryRecruiter
  def self.call(mercenary:, params:)
    new(mercenary, params)
  end

  private

  attr_reader :params, :mercenary

  def initialize(mercenary, params)
    @mercenary = mercenary
    @params = params
    employ
  end

  def employ
    clan = ClanFinder.new(params: params[:clan_id]).call
    building = BuildingFinder.new(params: params[:building_id]).call
    warrior_class = WarriorsQueries.choose_class(clan: clan)

    WarriorsQueries.create_mercenary_warrior(
      warrior_class: warrior_class,
      mercenary: mercenary,
      clan: clan,
      building: building
    )
    WeaponCreator.new(mercenary: mercenary).call
  end
end
