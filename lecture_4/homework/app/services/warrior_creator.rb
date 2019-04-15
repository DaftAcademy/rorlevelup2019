class WarriorCreator
  def initialize(params:)
    @id = params[:id]
    @clan_id = params[:clan_id]
    @building_id = params[:building_id]
  end

  def call
    attributes = find_attributes(id: @id, clan_id: @clan_id, building_id: @building_id)
    return {"error": "There are no warriors available"} unless attributes[:mercenary] && attributes[:mercenary].available_from < Time.now
    create_warrior(
      mercenary: attributes[:mercenary],
      clan: attributes[:clan],
      building: attributes[:building],
      warrior_class: attributes[:warrior_class]
    )
  end

  private

    def find_attributes(id: id, clan_id: clan_id, building_id: building_id)
      attr_hash = {}
      attr_hash[:mercenary] = MercenariesQuery.find_mercenary(id: @id)
      attr_hash[:clan] = ClansQuery.find_clan(clan_id: @clan_id)
      attr_hash[:building] = BuildingsQuery.find_building(building_id: @building_id)
      attr_hash[:warrior_class] = WarriorsQuery.find_class(clan: attr_hash[:clan])
      attr_hash
    end

    def create_warrior(mercenary:, clan:, building:, warrior_class:)
      warrior = warrior_class.create!(
        name: mercenary.name,
        clan: clan,
        building: building,
        preferred_weapon_kind: mercenary.preferred_weapon_kind,
        mercenary: mercenary
      )
      create_weapon(mercenary: mercenary)
      warrior
    end

    def create_weapon(mercenary:)
      WeaponCreator.new(mercenary: mercenary).call
    end
end
