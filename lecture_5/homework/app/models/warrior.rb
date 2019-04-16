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

  after_create :update_siege
  before_update :update_siege_was, if: :building_id_changed?
  after_update  :update_siege, if: :building_id_changed?
  after_destroy :update_siege

  def update_siege
    Reports::SiegeReport.call(building: building) if building
  end

  def update_siege_was
    if building_id_was!=building_id then
    Reports::SiegeReport.call(building: Building.find(building_id_was),warrior_id: id) if building_id_was
    end
  end


end
