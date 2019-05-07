# frozen_string_literal: true

class Samurai < ApplicationRecord
  belongs_to :clan
  validates name, presence: true
  validates armour_rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
  validates battle_count, presence: true
  validates join_date, presence: true
  # validates death_date
  scope :alive, -> { where('death_date IS NULL') }
  scope :dead, -> { where('death_date IS NOT NULL') }
end
