class Melee < Weapon
  validates :range, inclusion: { :in => 0..4, :message => "Range should be integer between 1 and 4" }

  def calculate_damage(distance)
    if distance > range
      injuries = 0
    elsif distance <= range
      injuries = damage * [*1..20].sample
  	else
  	  "Bad distance value, distance should be number"
  	end
  end
end
