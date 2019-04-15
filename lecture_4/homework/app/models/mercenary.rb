# frozen_string_literal: true

class Mercenary < ApplicationRecord
  belongs_to :warrior, optional: true

  validates :name, presence: true
  validates :experience, numericality: { greater_than_or_equal_to: 0 }
  validates :preferred_weapon_kind, presence: true, inclusion: { in: Weapon::KINDS }
  validates :available_from, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :warrior, uniqueness: { allow_nil: true }

  scope :available, -> { MercenariesQuery.available }
  scope :price_asc, -> { MercenariesQuery.price_asc }
  scope :exp_desc, -> { MercenariesQuery.exp_desc }
end
