class RangedWeapon < Weapon
  belongs_to :ra_wpnable, polymorphic: true
  def calculate_damage(distance)
  	distance = distance.abs
	range = range.abs
    if distance > range 
	  return 0
	else
      damage * (0.5 * distance/range + 0.25)
	end
  end
end
