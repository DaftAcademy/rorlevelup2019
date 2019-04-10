# frozen_string_literal: true

class BatteringRam < ApplicationRecord
  has_many :warriors, as: :defensible
end
