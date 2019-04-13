# frozen_string_literal: true

class WarriorCreator
  def initialize(params, mercenary = NullMercenary.new(params))
    @params = params
    @mercenary = mercenary
    @clan = ClansQuery.find_clan(params)
    @building = BuildingsQuery.find_building(params)
  end

  def call
    warrior = create_warrior
    create_weapon_for_warrior
    warrior
  end

  private

  attr_reader :params
  attr_reader :mercenary
  attr_reader :building
  attr_reader :clan

  def create_warrior
    warrior_class = WarriorsQuery.select_rarest_type_in_clan(clan)
    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind)
    mercenary.available = false
    mercenary.warrior = warrior
    warrior.mercenary = mercenary if mercenary.class == Mercenary
    warrior
  end

  def create_weapon_for_warrior
    WeaponCreator.new(mercenary).call
  end

  def warrior_params
    params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date, :type, :preferred_weapon_kind)
  end
end
