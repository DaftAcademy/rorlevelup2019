# frozen_string_literal: true

class Weapon < ApplicationRecord
  belongs_to :warrior
  validates :warrior, presence: true, uniqueness: true
  validates :damage, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 1000 }
  validates :range, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 1000 }
end
