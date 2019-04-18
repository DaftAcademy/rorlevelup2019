# frozen_string_literal: true

module Services
  class MercenaryEmployer
    def initialize(mercenary_params)
      @params = mercenary_params
    end

    def self.call(mercenary)
      clan = find_clan
      building = find_building
      warrior_class = Queries::WarriorsQuery.get_class
      warrior_class.create!(name: mercenary.name,
                            clan: clan,
                            building: building,
                            preferred_weapon_kind: mercenary.preferred_weapon_kind,
                            mercenary: mercenary)
      create_good_weapon(mercenary)
    end

    private

    attr_reader :params

    def find_building
      Queries::BuildingsQuery.find_by_id(params[:building_id])
    end

    def find_clan
      Queries::ClansQuery.find_by_id(params[:clan_id])
    end

    def create_good_weapon(mercenary)
      case mercenary.preferred_weapon_kind
      when :melee
        Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
      when :ranged
        Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
      else
        Nulls::NullWeapon.new
      end
    end
  end
end
