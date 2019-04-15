module WarriorHelper

  private

  def find_weapon
    weapon || Weapons::NullWeapon.new
  end
end
