# frozen_string_literal: true

class Weapon < ApplicationRecord
  belongs_to :warrior

  validates :name, presence: true
  validates :range, numericality: { greater_than_or_equal_to: 0 }
  validates :damage, numericality: { greater_than_or_equal_to: 0 }
end
