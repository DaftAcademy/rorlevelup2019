class Samurai < ApplicationRecord
  belongs_to :clan

  validates_presence_of :name, :armor_quality, :battle_count
  validates_length_of :name, minimum: 2, maximum: 256
  validates_numericality_of :armor_quality, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000
end
