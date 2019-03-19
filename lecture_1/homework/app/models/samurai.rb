class Samurai < ApplicationRecord
    belongs_to :clan

    validates :name, presence: true, length: { maximum: 256 }
    validates :armor, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
    validates :join_date, presence: true
    validates :battles, presence: true, numericality: { greater_than_or_equal_to: 0 }

    scope :dead, -> { where.not(death_date: nil) }
    scope :alive, -> { where(death_date: nil) } 
end
