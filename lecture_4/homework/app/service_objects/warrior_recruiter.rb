# frozen_string_literal: true

class WarriorRecruiter
  attr_reader :mercenary, :params

  def initialize(mercenary:, params:)
    @mercenary = mercenary
    @params = params
  end

  def call
    clan = find_clan
    building = find_building
    warrior_class = WarriorClassFinder.new(relation: clan.warriors,
                                           type: params[:type]).call
    WarriorCreator.new(relation: warrior_class,
                       clan: clan,
                       building: building,
                       mercenary: mercenary).call
  end

  private

  def find_building
    Building.find(params[:building_id]) if params[:building_id]
  end

  def find_clan
    if params[:clan_id]
      Clan.find(params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
