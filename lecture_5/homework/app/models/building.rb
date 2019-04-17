# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :warriors, dependent: :nullify
  validates :type, inclusion: { in: %w[Buildings::Stronghold Buildings::Walls] }
  validates :siege_ability, presence: true,
                            numericality: { greater_than_or_equal_to: 0,
                                            only_integer: true }
  validates :granary, presence: true,
                      numericality: { greater_than_or_equal_to: 0,
                                      only_integer: true }

  def update_siege_abilities
    Reports::SiegeReport.new(building: self).call
  end
end
