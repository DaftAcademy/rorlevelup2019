# frozen_string_literal: true

class Warrior < ApplicationRecord
  belongs_to :clan
  belongs_to :construction
  has_one :weapon, dependent: :destroy

  validates :name,
            presence: true,
            uniqueness: { scope: %i[alive clan_id] }
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  validates :type, presence: true

  scope :alive, -> { where('death_date IS NULL') }
  scope :dead, -> { where('death_date IS NOT NULL') }
end
