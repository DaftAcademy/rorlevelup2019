class Weapon < ApplicationRecord
  belongs_to :warrior
  validates :range, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :damage, presence: true, numericality: true

  def self.types
    %w[Magical Melee Ranged]
  end
end
