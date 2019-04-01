class Weapon < ApplicationRecord
  belongs_to :warrior

  validates :name, presence: true
  validates :range, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :damage, numericality: { only_integer: true, greater_than_or_equal_to: 0}
end
