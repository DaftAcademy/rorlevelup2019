class Weapon < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :min_range, numericality: { only_integer: true }
  validates :max_range, numericality: { only_integer: true }
  validates :damage, numericality: { only_integer: true }
  validates :warrior_id, uniqueness: true

end