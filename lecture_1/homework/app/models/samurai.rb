class Samurai < ApplicationRecord
  belongs_to :clan
  validates :name, presence: true, length: { maximum: 64 }
  validates :armor, presence: true
  validates_inclusion_of :armor, in: 0..1000,
                         message: "should have a value between 0 and 1000"
  validates :battles, presence: true,
                      numericality: { greater_than_or_equal_to: 0 }
  scope :alive, -> { where(died_at: nil) }
  scope :dead, -> { where.not(died_at: nil) }
end
