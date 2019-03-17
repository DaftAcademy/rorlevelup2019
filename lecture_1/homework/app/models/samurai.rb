class Samurai < ApplicationRecord
  belongs_to :clan
  validates :name, presence: true, uniqueness: true, length: {in: 2..30}
  validates :armor, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000, only_integer: true }
  validates :battles, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :join_date, presence: true
end
