module WarriorHelper
  
  private

  def find_weapon
    weapon || NullWeapon.new
  end
end
