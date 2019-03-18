class Samurai < ApplicationRecord

  belongs_to :clan

  validates :armour, presence: true, numericality: { greather_than: 0, less_than_or_equal_to: 1000 }
  validates :name, presence: true

end
