class Warrior < ApplicationRecord
    belongs_to :clan
    belongs_to :structure
    belongs_to :weapon

    validates :name, presence: true, uniqueness: { scope: :clan_id, conditions: -> { where('death_date IS NULL') },
                                                 message: "The name has to be unique within clan's alive members." }
    
    validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }

    validates :number_of_battles, numericality: { only_integer: true, 
                                                greater_than_or_equal_to: 0 }

    scope :alive, -> { where('death_date IS NULL') }
    scope :dead, -> { where('death_date IS NOT NULL') }
end
