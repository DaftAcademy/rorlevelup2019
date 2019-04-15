class WeaponCreator
  def initialize(mercenary:)
    @mercenary = mercenary
  end

  def call
    case @mercenary.preferred_weapon_kind.to_sym
    when :melee
      Weapons::Katana.create!(warrior: @mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: @mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::NullWeapon.create!(warrior: @mercenary.warrior, range: 1, damage: 1)
    end
  end
end
