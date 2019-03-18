class Samurai < ApplicationRecord
  
  belongs_to :clan

  validates :name, presence: true
  validates :armour, presence: true,
                     numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

end
