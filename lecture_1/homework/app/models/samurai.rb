class Samurai < ApplicationRecord
  validates :name, presence: :true
  validates :armor, presence: :true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}
  belongs_to :clan
end
