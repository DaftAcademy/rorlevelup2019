# frozen_string_literal: true

class Mercenary < ApplicationRecord
  belongs_to :warrior, optional: true

  validates :name, presence: true
  validates :experience, numericality: { greater_than_or_equal_to: 0 }
  validates :preferred_weapon_kind, presence: true, inclusion: { in: Weapon::KINDS }
  validates :available_from, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :warrior, uniqueness: { allow_nil: true }

  scope :employed, -> { MercenariesQuery.employed }
  scope :unemployed, -> { MercenariesQuery.unemployed }
  scope :currently_available, -> { MercenariesQuery.currently_available }
  scope :most_experienced, -> { MercenariesQuery.most_experienced }
end
