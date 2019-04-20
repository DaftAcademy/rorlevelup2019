# frozen_literal_string: true

class MercenaryEmployer
  def initialize(mercenary_params)
    @params = mercenary_params
  end

  def self.call(mercenary)
    clan = find_clan
    building = find_building
    warrior_class = WarriorQuery.get_class
    warrior_class.create(name: mercenary.name,
                         clan: clan,
                         building: building,
                         preffered_weapon_kind: preffered_weapon_kind,
                         mercenary: mercenary)
    create_good_weapon(mercenary)
  end

  private

  attr_reader :params

  def find_building
    BuildingsQuery.find_by_id(params[:building_id])
  end

  def find_clan
    ClansQuery.find_by_id(params[:clan_id])
  end

  def create_good_weapon(mercenary)
    case mercenary.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      NullWeapon.new
    end
  end
end
