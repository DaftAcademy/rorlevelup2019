# frozen_string_literal: true

class Trench < ApplicationRecord
  has_many :warriors, as: :defensible
end
