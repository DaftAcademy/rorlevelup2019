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
  end
end

class ClanFinder
  def initialize(params:)
    @params = params
  end

  def call
    find_clan
  end

  private

  attr_reader :params

  def find_clan
    ClansQueries.find(clan_id: params)
  end
end

class BuildingFinder
  def initialize(params:)
    @params = params
  end

  def call
    find_building
  end

  private

  attr_reader :params

  def find_building
    BuildingsQueries.find_building(id: params)
  end
end
