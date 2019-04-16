# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :warriors, dependent: :nullify

  validates :granary, presence: true,
                      numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
