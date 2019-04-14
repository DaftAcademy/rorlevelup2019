class MagicalWeapon < Weapon
  belongs_to :ma_wpnable, polymorphic: true
  def calculate_damage(distance)
  	distance = distance.abs
	range = range.abs
    if distance > range 
	  return 0
	else
      damage * (0.5 * (1-distance/range) + 0.25)
	end
  end
end
