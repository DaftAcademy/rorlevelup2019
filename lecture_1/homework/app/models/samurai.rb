class Samurai < ApplicationRecord
  belongs_to :clan

  validates :name, presence: true, length: {maximum: 256}
  validates :armor, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}
  validates :battles, numericality: {greater_than_or_equal_to: 0}
  validates :join_date, presence: true

  scope :dead, -> {where.not(killed_date: nil)}
  scope :alive, -> {where(killed_date: nil)}
end
