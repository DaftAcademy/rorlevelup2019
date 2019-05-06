class Ranged < Weapon
  validates :range, inclusion: { :in => 4..100, :message => "Range should be integer between 4 and 100" }

  def calculate_damage(distance)
    if distance > range
      injuries = 0
    elsif distance <= range && distance > 4
      injuries = damage * [*1..8].sample
    elsif distance <= 4
      injuries = damage
  	else
  	  "Bad distance value, distance should be integer"
  	end
  end
end
