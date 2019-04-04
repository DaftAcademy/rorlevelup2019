# frozen_string_literal: true

class Tree < ApplicationRecord
  has_many :warriors, as: :defensible

  validates :name, presence: true, uniqueness: true
end
