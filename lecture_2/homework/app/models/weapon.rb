class Weapon < ApplicationRecord
  belongs_to :warrior, optional: true

  # enum kind: { melee: 0, ranged: 1, magical: 2 }

  validates :name, presence: :true
  validates :damage, numericality: { greater_than: 0, less_than: 1000 }

end
