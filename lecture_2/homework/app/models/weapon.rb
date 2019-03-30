class Weapon < ApplicationRecord
  belongs_to :weaponable, polymorphic: true

  validates :name, presence: true

  validates :range, :damage, numericality: { only_integer: true,
                                             greater_than_or_equal_to: 0,
                                             less_than_or_equal_to: 100 }
end
