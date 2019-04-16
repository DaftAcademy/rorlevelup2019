# frozen_string_literal: true

class Warrior < ApplicationRecord
  belongs_to :clan, counter_cache: true
  belongs_to :building, optional: true
  has_one :weapon, dependent: :destroy
  has_one :mercenary

  validates :name, presence: true, uniqueness: { conditions: -> { where(death_date: nil) } }
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  validates :preferred_weapon_kind, presence: true, inclusion: { in: Weapon::KINDS }

  scope :alive, -> { where('death_date IS NULL') }
  scope :dead, -> { where('death_date IS NOT NULL') }
end
