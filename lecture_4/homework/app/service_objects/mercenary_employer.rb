# frozen_string_literal: true

module ServiceObjects
  class MercenaryEmployer
    def initialize(params)
      @params = params
    end

    def employ_best
      mercenary = QueryObjects::MercenaryQuery.available_by_exp.first
      # Probaly should have used NullObject, but it will take nil to warrior reference
      return unless mercenary

      clan = find_clan
      building = find_building
      warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
      warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
      create_good_weapon(mercenary)
      warrior
    end

    def employ(mercenary)
      clan = find_clan
      building = find_building
      warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
      warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
      create_good_weapon(mercenary)
      warrior
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
