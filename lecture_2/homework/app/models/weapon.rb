class Weapon < ApplicationRecord
  belongs_to :warrior
  validates :name, presence: true
  validates :damage, numericality: { greater_than_or_equal_to: 1 }
  validates :range, numericality: { greater_than_or_equal_to: 1 }
end
