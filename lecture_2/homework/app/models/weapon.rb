class Weapon < ApplicationRecord
  belongs_to :offensible, polymorphic: true
  validates :name, presence: true
  validates :range, presence: true, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  validates :damage, presence: true, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
end
