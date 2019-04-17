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
  before_update :update_prev_building
  # cant put same if: :building_id_changed?  since it will always return false
  after_update  :update_siege_after
  # after_commit :update_siege_after
  after_destroy :update_siege

  def update_siege
    # call after warrior already was asigned to building list after create,update
    # works for delete as well
    Reports::SiegeReport.call(building: building) if building
  end

  # it seems like rspec didnt invoke those callbacks
  # when i was testing manually it works
  # probably messed up in factory and tests :(
  def update_siege_after
    if prev_building_id
      # if warrior changed his building run this on both
      # since in that moment he is no longer in old list , rather in new building
      # so this way i can keep both old and new buildings updated
      # puts "prev building: #{prev_building_id} current: #{building_id}"
      Reports::SiegeReport.call(building: Building.find(prev_building_id))
      Reports::SiegeReport.call(building: Building.find(building_id))
      # set this to nil to prevent callback invoking from random update
      update_column(:prev_building_id, nil)
    end
  end

  def update_prev_building
    # if warrior is changing his buildings
    if building_id_was != building_id
      # save this attribute wihtout triggering callbacks
      update_column(:prev_building_id, building_id_was)
    end
  end
end
