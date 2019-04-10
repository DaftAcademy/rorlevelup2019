class WeaponCreator

  attr_reader  :warrior

  def initialize(warrior: Warrior)
    @warrior = warrior
  end

  private

  def create_good_weapon
    case warrior.preferred_weapon_kind
    when :melee
      Weapons::Katana.create!(warrior: warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: warrior, range: 40, damage: 10)
  # when :magical
      # implement magical
    else
      Weapons::Katana.create!(warrior: warrior, range: 1, damage: 10) 
    end
  end

end
