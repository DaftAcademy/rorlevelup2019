class Weapon < ApplicationRecord
  #belongs_to :weaponable, polymorphic: true
  validates :name, presence: true
  validates :damage, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 100 }
  validates :range, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 100 }
end
