# frozen_string_literal: true

class Weapon < ApplicationRecord
  KINDS = %w[Melee Magical Ranged].freeze

  belongs_to :warrior

  validates :name, presence: true
  validates :type, inclusion: { in: KINDS }
  validates :range, :damage, numericality: { only_integer: true,
                                             greater_than_or_equal_to: 0,
                                             less_than_or_equal_to: 100 }
  validate  :weapon_match

  private

  def weapon_match
    unless warrior.weapon_of_choice == type
      errors.add(:warrior, "weapon doesn't match")
    end
  end
end
