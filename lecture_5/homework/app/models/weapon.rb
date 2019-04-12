# frozen_string_literal: true

class Weapon < ApplicationRecord
  KINDS = %w[magical melee ranged].freeze

  belongs_to :warrior

  validates :range, numericality: { greater_than_or_equal_to: 0 }
  validates :damage, numericality: { greater_than_or_equal_to: 0 }
  validates :kind, inclusion: { in: KINDS }

  validate :can_be_used?

  private

  def can_be_used?
    return unless warrior
    return if warrior.preferred_weapon_kind == kind

    errors.add(:warrior, :invalid, message: "can't fight with this weapon")
  end
end
