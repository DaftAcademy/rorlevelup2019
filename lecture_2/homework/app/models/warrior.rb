class Warrior < ApplicationRecord
    belongs_to :clan
    belongs_to :defensible, polymorphic: true
    has_one :weapon, dependent: :destroy 
    validates :name, presence: true, uniqueness: {conditions: -> {where('death_date IS NULL')}}
    validates :armor_quality, numericality: { only_integer: true,
                                              greater_than_or_equal_to: 0,
                                              less_than_or_equal_to: 100 }
  
    scope :alive, -> { where('death_date IS NULL') }
    scope :dead, -> { where('death_date IS NOT NULL') }

    def attack
        "Ugabuga!"
    end
end
