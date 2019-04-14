class MeleeWeapon < Weapon
  belongs_to :me_wpnable, polymorphic: true
  def calculate_damage(distance)
	distance = distance.abs
	range = range.abs
    if distance > range 
	  return 0
	else
      damage * (1 - distance / range)
	end
  end
end
