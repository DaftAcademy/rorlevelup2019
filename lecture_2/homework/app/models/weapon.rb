# frozen_string_literal: true

class Weapon < ApplicationRecord
  belongs_to :offensive, polymorphic: true

  validates :name, presence: true
  validates :damage, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0 }
  validates :range, numericality: { greater_than_or_equal_to: 0 }
end
