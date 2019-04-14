class Character < ApplicationRecord
  belongs_to :clan
  has_one :weapon, dependent: :destroy
  belongs_to :defensible, polymorphic: true, optional: true
  
  validates :name, presence: true, uniqueness: { scope: ['death_date.present?', :clan_id] }
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 1000 }
  validates :weapon, inclusion: { in: %w(magical_weapon melee_weapon ranged_weapon)}, allow_nil: true

  scope :alive, -> { where('death_date IS NULL') }
  scope :dead, -> { where('death_date IS NOT NULL') }
end
