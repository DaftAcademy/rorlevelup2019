class Samurai < ApplicationRecord
	belongs_to :clan
	validates name, presence: true
	validates armour_rating, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}
	#validates battle_count, 
	#validates join_date,
	#validates death_date,

end
