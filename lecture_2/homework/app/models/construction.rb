# frozen_string_literal: true

class Construction < ApplicationRecord
  has_many :warriors
  validates :type, presence: true
end
