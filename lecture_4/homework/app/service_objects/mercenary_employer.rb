#frozen_string_literal: true
module ServiceObjects
  class MercenaryEmployer
    def initialize(params)
      @params = params
    end

    def call(mercenary)
      clan = find_clan
      building = find_building
      # warrior_class = QueryObjects::ClanQuery.find_popular_class(clan)
      # warrior = Warrior.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary, type: warrior_class)
      warrior = Factory::WarriorFactory.create(clan: clan, building: building, mercenary: mercenary)
      create_good_weapon(mercenary)
    end

    private

    attr_reader :params

    def find_building
      QueryObjects::BuildingQuery.find_by_id(params[:building_id])
    end

    def find_clan
      QueryObjects::ClanQuery.find_by_id(params[:clan_id])
    end

    def create_good_weapon(mercenary)
      Factory::WeaponFactory.create(mercenary)
    end
  end
end