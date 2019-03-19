class Samurai < ApplicationRecord
  belongs_to :clan

  validates :name, presence: true
  validates :armor, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, only_integer: true }
  validates :fought_battles, presence: true, numericality: { only_integer: true }
end
