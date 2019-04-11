class Warrior < ApplicationRecord
  belongs_to :clan
  belongs_to :defensible, polymorphic: true

  validates :name, presence: true, uniqueness: {scope: :clan_id, conditions: -> { where(death_date: nil) },
  							 , message: "There can't be 2 warriors with the same name in a clan" }
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }

  scope :alive, -> { where(death_date: nil) }
  scope :dead, -> { where.not(death_date: nil) }
end