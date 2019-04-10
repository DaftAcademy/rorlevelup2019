class MercenaryRecruiter

  def run
    return unless @mercenary.available_from < Time.now
    create_good_weapon()
    warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
  end

  def initialize(params)
    @params = params
    @mercenary = Mercenary.find(@params[:id])
  end

  private

  # Set up methods to provide data for warrior creation

  def clan
    ClanFinder.new(@params).run
  end

  def building
    BuildingFinder.new(@params).run
  end

  def create_good_weapon()
    warrior = WarriorFinder.new(params).run
    WeaponCreator.new(warrior).run
  end

end
