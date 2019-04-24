# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :warriors, dependent: :nullify
  KINDS = %w[Buildings::Walls Buildings::Stronghold].freeze

  validates :name, presence: true
  validates :granary, :siege_ability, :horse_units, :infantry_units, presence: true,
                                                                     numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :type, presence: true, inclusion: { in: KINDS }
end
