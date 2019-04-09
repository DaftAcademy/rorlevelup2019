class Warrior < ApplicationRecord
  belongs_to :clan

  validates :name, presence: true
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  validates :kind, inclusion: { in: %w(Samurai Hussar Archer Peasant ) }

  scope :alive, -> { where('death_date IS NULL') }
  scope :dead, -> { where('death_date IS NOT NULL') }
end
