class Magical < Weapon
  validates :range, inclusion: { :in => 0..100, :message => "Range should be integer between 1 and 100" }

  def calculate_damage(distance)
    if distance > range
      injuries = 0
    elsif distance <= range
      injuries = damage * [*1..4].sample
  	else
  	  "Bad distance value, distance should be integer"
  	end
  end
end
