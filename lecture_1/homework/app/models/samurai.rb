class Samurai < ApplicationRecord
  belongs_to :clan
  validates :name, presence: true
  validates :armor_quality, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}
  scope :alive, -> { where('death_date is NULL')}
  scope :death, -> { where('death_date is NOT NULL')}
end
